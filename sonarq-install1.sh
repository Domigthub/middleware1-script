#!/bin/bash

##Author: Dominique-N, Dnng....@gmail.com, 5x 
#Date: June 28,2022
##Description: Sonarqube Installation

echo "Sonarqube Installation"

sudo yum update -y

if
   [ UID -ne 1000 ]

   then
  echo " Please login as vagrant "
  exit 2
   fi
   sleep 2

sudo yum install java-11-openjdk-devel -y

if [ $? -ne 0 ]
  then
echo "Installation failed "
 exit 1
fi

sudo yum install java-11-openjdk -y
if
 [ $? -ne 0 ]
 then
echo "Installation failed "
 exit 3
fi
cd /opt
 sudo yum install wget -y
sleep 2
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip

sudo yum install unzip -y

sudo unzip /opt/sonarqube-9.3.0.51899.zip

sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
sleep 2
cd sonarqube-9.3.0.51899/bin/linux-x86-64
sleep 2
./sonar.sh start