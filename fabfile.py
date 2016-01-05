
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
	run('cd submodulo-lorenzo/ && sudo sh install.sh')

#Sincronizacion de la aplicacion y la base de datos
def sincronizacion():
	run('cd submodulo-lorenzo/ && python manage.py syncdb --noinput')

#Ejecucion de test
def testeo():
	run('cd submodulo-lorenzo/ && make test')

#Ejecucion de la aplicacion
def ejecucion():
	run('cd submodulo-lorenzo/ && make run')

#peticion
def peticion():
	run('curl http://0.0.0.0:80/')



#Ejecucion remota del docker
#Instalacion de docker y descarga de imagen
def getDocker():
	run('sudo apt-get update')
	run('sudo apt-get install -y docker.io')
	run('sudo docker pull lorenmanu/submodulo-lorenzo')

#Ejecucion de docker
def runDocker():
	run('sudo docker run -p 80:80 -i -t lorenmanu/submodulo-lorenzo')