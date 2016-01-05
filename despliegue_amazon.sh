#! /bin/bash

echo "Introduce el achivo .pem"
read archivo
echo "Introduce tu host de Amazon"
read host
chmod 400 $archivo
echo "Tu archivo .pem es $archivo"
echo "Tu host en Amazon es $host"

echo "================================================"
echo "================================================"
echo "Iniciamos despliegue de la aplicacion en Amazon"
echo "================================================"
echo "================================================"

echo "                                                "
echo "================================================"
echo "Información de tu máquina:"
ssh -i "$archivo" ubuntu@$host 'uname -s'
echo "================================================"
echo "                                                "

echo "                                                "
echo "================================================"
echo "Descargamos la aplicación desde el repositorio:"
ssh -i "$archivo" ubuntu@$host 'sudo apt-get update'
ssh -i "$archivo" ubuntu@$host 'sudo apt-get install -y git'
ssh -i "$archivo" ubuntu@$host 'sudo git clone https://github.com/lorenmanu/submodulo-lorenzo.git'
echo "================================================"
echo "                                                "

echo "                                                "
echo "================================================"
echo "Instalamos todo lo necesario para que la aplicación funcione:"
ssh -i "$archivo" ubuntu@$host 'cd submodulo-lorenzo/ && sudo sh install.sh'
echo "================================================"
echo "                                                "


echo "                                                "
echo "================================================"
echo "Sincronizamos la aplicación con la base de datos:"
ssh -i "$archivo" ubuntu@$host 'cd submodulo-lorenzo/ && python manage.py syncdb --noinput'
echo "================================================"
echo "                                                "

echo "                                                "
echo "================================================"
echo "Ejecutamos tests:"
ssh -i "$archivo" ubuntu@$host 'cd submodulo-lorenzo/ && make test'
echo "================================================"
echo "                                                "


echo "                                                "
echo "================================================"
echo "Instalamos Docker e instalamos la Imagen:"
ssh -i "$archivo" ubuntu@$host 'sudo apt-get update'
ssh -i "$archivo" ubuntu@$host 'sudo apt-get install -y docker.io'
ssh -i "$archivo" ubuntu@$host 'sudo docker pull lorenmanu/submodulo-lorenzo'
echo "================================================"
echo "================================================"
echo "================================================"
echo "Va a instalar el docker lorenmanu:"
ssh -i "$archivo" ubuntu@$host 'sudo docker run -p 80:81 -i -t lorenmanu/submodulo-lorenzo:MiTienda /bin/bash'
echo "================================================"
echo "================================================"
echo "================================================"
echo "================================================"
echo "                                                "


