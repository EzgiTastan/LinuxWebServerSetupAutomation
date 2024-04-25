#!/bin/bash

#Variable Declaration
PACKAGE="httpd wget unzip"
SVC="httpd"
URL="https://www.tooplate.com/zip-templates/2110_character.zip"
ART_NAME="2110_character"
TEMPDIR="/tmp/webfiles"

# Installing Dependencies
echo "########################################################"
echo "Installing packages"
echo "########################################################"
sudo yum install $PACKAGE -y > /dev/null
echo

# Start and Enable The Service
echo "########################################################"
echo "Start and Enable HTTPD Service"
echo "########################################################"
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo

#Creating a Temp Directory
echo "########################################################"
echo "Starting Artifact Deployment"
echo "########################################################"
mkdir -p $TEMPDIR
cd $TEMPDIR
echo

wget $URL > /dev/null
unzip $ART_NAME.zip > /dev/null
sudo cp -r $ART_NAME/* /var/www/html/
echo

#Bounce Service
echo "########################################################"
echo "Restarting HTTPD Service"
echo "########################################################"
systemctl restart $SVC
echo

#Clean Up
echo "########################################################"
echo "Removing Temporary Files"
echo "########################################################"
rm -rf $TEMPDIR
echo

sudo systemctl status $SVC
ls /var/www/html/