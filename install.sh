#!/bin/bash

# PATH
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Store the base dir
BASEDIR=$( cd $(dirname $0); pwd)

# Get all dependencies
sudo yum update
sudo yum -y install libcurl-devel

# Stuff used by Ballistiq often
# ImageMagick (used by Paperclip gem)
sudo yum -y install  imagemagick
# MySQL headers. Required by mysql2 gem
sudo yum -y install mysql-dev 

# Install Ruby
curl -L https://get.rvm.io | bash -s stable --rails --autolibs=enabled

# Install Passenger - which will install Nginx
gem install passenger --pre
passenger-install-nginx-module --auto --prefix=/opt/nginx --auto-download

# Install the control nginx control script
sudo cp $BASEDIR/nginx.initd /etc/init.d/nginx
sudo chmod +x /etc/init.d/nginx
sudo update-rc.d -f nginx defaults

# Add log rotation to nginx
sudo cp $BASEDIR/nginx.logrotate /etc/logrotate.d/nginx

# Use service to start nginx
sudo service nginx start
