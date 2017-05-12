#! /bin/bash

#To install dependency
sudo apt-get update
sudo apt-get install php7.0 php7.0-* phpmyadmin php-mysql php-mcrypt
sudo apt-get install apache2
sudo apt-get install mysql-server*
sudo apr-get install wget

# Read user name and password for proxy server
echo -n User name for proxy: 
read userName
echo -n Password for proxy: 
read -s password

# export proxy on terminal...
export http_proxy=http://$userName:$password@196.1.114.80:2222/
export https_proxy=https://$userName:$password@196.1.114.80:2222/

#Download Drupal6,7,8
wget -nc https://ftp.drupal.org/files/projects/drupal-6.31.tar.gz
wget -nc https://ftp.drupal.org/files/projects/drupal-7.0.tar.gz
wget -nc https://ftp.drupal.org/files/projects/drupal-8.0.0.tar.gz

#Extract tar files
for f in *.tar.gz; do tar xfk $f; done

#Remove tar.gz files
rm -rf *.tar.gz

#Remove index.php (apache)file from localhost
sudo rm index.php

#Copy Drupal in /var/www/html/
sudo mkdir /var/www/html/demo
sudo cp -r drupal-* /var/www/html/demo/

#makeing of dependency files...
sudo cp /var/www/html/demo/drupal-8.0.0/sites/default/default.settings.php /var/www/html/demo/drupal-8.0.0/sites/default/settings.php
sudo mkdir /var/www/html/demo/drupal-8.0.0/sites/default/files

sudo cp /var/www/html/demo/drupal-7.0/sites/default/default.settings.php /var/www/html/demo/drupal-7.0/sites/default/settings.php
sudo mkdir /var/www/html/demo/drupal-7.0/sites/default/files

sudo cp /var/www/html/demo/drupal-6.31/sites/default/default.settings.php /var/www/html/demo/drupal-6.31/sites/default/settings.php
sudo mkdir /var/www/html/demo/drupal-6.31/sites/default/files

#Give permission

sudo chmod 777 /var/www/html/demo/drupal-8.0.0/sites/default/*
sudo chmod 777 /var/www/html/demo/drupal-7.0/sites/default/*
sudo chmod 777 /var/www/html/demo/drupal-6.31/sites/default/*
