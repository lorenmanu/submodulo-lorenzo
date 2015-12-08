FROM ubuntu:latest

#Autor
MAINTAINER Lorenzo Manuel Rosas Rodríguez <lorenrr1@gmail.com>

#Actualizar Sistema Base
RUN sudo apt-get -y update

#Descargar aplicacion
RUN sudo apt-get install -y git
RUN sudo git clone https://github.com/lorenmanu/submodulo-lorenzo.git

# Instalar Python y PostgreSQL
RUN sudo apt-get install -y python-setuptools
RUN sudo apt-get -y install python-dev
RUN sudo apt-get -y install build-essential
RUN sudo apt-get -y install python-psycopg2
RUN sudo apt-get -y install libpq-dev
RUN sudo easy_install pip
RUN sudo pip install --upgrade pip

#Instalar la app
RUN ls
RUN cd IV_javiergarridomellado/ && ls -l
RUN cd IV_javiergarridomellado/ && cat requirements.txt
RUN cd IV_javiergarridomellado/ && sudo pip install -r requirements.txt

#Migraciones
RUN cd submodulo-lorenzo/ && python manage.py syncdb --noinput