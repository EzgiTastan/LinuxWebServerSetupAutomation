#!/bin/bash

# Installing Dependencies
echo "########################################################"
echo "Installing packages"
echo "########################################################"
sudo yum install wget unzip httpd -y > /dev/null
echo

# Start and Enable The Service
echo "########################################################"
echo "Start and Enable HTTPD Service"
echo "########################################################"
sudo systemctl start httpd
sudo systemctl enable httpd
echo

#Creating a Temp Directory
echo "########################################################"
echo "Starting Artifact Deployment"
echo "########################################################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles
echo

wget https://www.tooplate.com/zip-templates/2110_character.zip > /dev/null
unzip 2110_character.zip > /dev/null
sudo cp -r 2110_character/* /var/www/html/
echo

#Bounce Service
echo "########################################################"
echo "Restarting HTTPD Service"
echo "########################################################"
systemctl restart httpd
echo

#Clean Up
echo "########################################################"
echo "Removing Temporary Files"
echo "########################################################"
rm -rf /tmp/webfiles
echo

sudo systemctl status httpd
ls /var/www/html/