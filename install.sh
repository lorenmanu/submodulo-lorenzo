#!/bin/bash


#Actualizar Sistema Base
sudo apt-get -y update

#Descargar aplicacion
sudo apt-get install -y git
sudo git clone https://github.com/lorenmanu/submodulo-lorenzo.git

# Instalar Python y PostgreSQL
sudo apt-get install -y python-setuptools
sudo apt-get -y build-dep python-imaging --fix-missing
sudo apt-get -y install python-dev
sudo apt-get -y install build-essential
sudo apt-get -y install python-psycopg2
sudo apt-get -y install libpq-dev
sudo apt-get install python2.7
sudo easy_install pip
sudo easy_install Pillow

#Instalar la app
sudo pip install -r requirements.txt
