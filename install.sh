#!/bin/bash

# PATH
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Store the base dir
BASEDIR=$( cd $(dirname $0); pwd)

# Get all dependencies
sudo yum update
sudo yum -y install libcurl-devel mysql mysql-server mysql-devel nginx


# Install Rvm
curl -L https://get.rvm.io | bash -s stable --rails --autolibs=enabled

# Install Rubinius for Ruby 1.9
rvm install rbx --1.9

# Deploy!

# Copy nginx conf from config/server/ to /opt/nginx/conf/ abd Start server
#sudo service nginx start
