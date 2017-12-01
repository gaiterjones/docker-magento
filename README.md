# DOCKER MAGENTO CE 1.X CONTAINER

Docker image for Magento 1.x based on https://hub.docker.com/r/alexcheng/magento/

Install Magento 1.9.3.7 for Development and Testing

git clone

# Build

docker-compose build

# Start

docker-compose up -d

# Magento setup and Sample Data

docker exec -it dockermagento_web_1 install-sampledata

docker exec -it dockermagento_web_1 install-magento

# Includes n98-magerun and modman

docker exec -it dockermagento_web_1 n98-magerun config:dump

# Connect

http://local.magento/admin
