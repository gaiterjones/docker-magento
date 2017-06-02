FROM occitech/magento:php5.5-apache

ENV MAGENTO_VERSION 1.9.3.3
#ENV MAGENTO_VERSION 1.9.3.2

RUN cd /tmp && curl https://pe.terjon.es/dropbox/magento-$MAGENTO_VERSION.tar.gz -o $MAGENTO_VERSION.tar.gz && tar xvf $MAGENTO_VERSION.tar.gz && mv magento/* magento/.htaccess /var/www/htdocs

RUN chown -R www-data:www-data /var/www/htdocs

RUN apt-get update && apt-get install -y mysql-client-5.5 libxml2-dev git wget
RUN docker-php-ext-install soap

COPY ./bin/install-magento /usr/local/bin/install-magento
RUN chmod +x /usr/local/bin/install-magento

COPY ./sampledata/magento-sample-data-1.9.1.0.tgz /opt/
COPY ./bin/install-sampledata-1.9 /usr/local/bin/install-sampledata
RUN chmod +x /usr/local/bin/install-sampledata

RUN bash -c 'bash < <(curl -s -L https://raw.github.com/colinmollenhour/modman/master/modman-installer)'
RUN mv ~/bin/modman /usr/local/bin

VOLUME /var/www/htdocs
RUN sed -i 's/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www\/htdocs/' /etc/apache2/sites-available/000-default.conf
RUN sed -i 's/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www\/htdocs/' /etc/apache2/sites-available/default-ssl.conf

#COPY redis.conf /var/www/htdocs/app/etc/
