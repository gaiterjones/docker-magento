# DOCKER MAGENTO CE 1.X CONTAINER

Docker image for Magento 1.x based https://hub.docker.com/r/alexcheng/magento/

Install Magento 1.9.3.3 for Develeopment and Testing

git clone

# Build

docker-compose build

# Start

docker-compose up -d

# Magento setup and Sample Data

docker exec -it dockermagento_web_1 install-sampledata
docker exec -it dockermagento_web_1 install-magento

# Connect

http://local.magento/admin

# more info

https://hub.docker.com/r/alexcheng/magento/