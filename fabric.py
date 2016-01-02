from fabric.api import run, local, hosts, cd
from fabric.contrib import django

#infomacion del host
def informacion_host():
    run('uname -s')

#descarga de la aplicacion utilizando git
def get_aplicacion():
	run('sudo apt-get update')
	run('sudo apt-get install -y git')
	run('sudo git clone https://github.com/lorenmanu/submodulo-lorenzo.git')

#Instalacion necesaria para host virgen
def instalacion():
	run('sudo sh install.sh')

#Sincronizacion de la aplicacion y la base de datos
def sincronizacion():
	run('python manage.py syncdb --noinput')

#Ejecucion de test
def testeo():
	run('make test')

#Ejecucion de la aplicacion
def ejecucion():
	run('make run')

#peticion
def peticion():
	run('curl http://localhost:80/')



#Ejecucion remota del docker
#Instalacion de docker y descarga de imagen
def getDocker():
	run('sudo apt-get update')
	run('sudo apt-get install -y docker.io')
	run('sudo docker pull lorenmanu/submodulo-lorenmanu')

#Ejecucion de docker
def runDocker():
	run('sudo docker run -i -t lorenmanu/submodulo-lorenmanu /bin/bash')