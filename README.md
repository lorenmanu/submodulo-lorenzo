## **Proyecto de IV(infraestructura Virtual junto con DAI(DESARROLO DE APLICACIONES DE INTERNET** ##

###Breve Descripción/Introducción:

El proyecto consiste en una plataforma de compra/venta de productos on-line. La plataforma contiene varias secciones para la venta de todo tipo de productos. La plataforma consiste en una página web donde cualquiera podra ver los productos que se venden, pero para poder vender o comprar será necesario registro. Si el vendedor se encuentra conectado, cualquier comprador potencial podrá chatear con el para preguntarle sobre el productos.

Cada anuncio vendra acompañado de una foto y una descripcion del producto que se ajuste a la realidad. Cada producto deberá estar bien situado en su sección correspondiente.

Cada usuario podrá tener una lista de productos favoritos.

Habrá moderadores que podrán eliminar cualquier anuncio de material fuera de la ley o que no se ajuste a la política de la plataforma.

La plataforma albergará un foro donde poder opinar sobre las diferentes transacciones.

**El módulo  Lorenzo Manuel Rosas Rodríguez**: Este módulo implementará el sistema web, por lo que se encargará de la interfaz gráfica de la misma así como de la parte que lanzará peticiones de operaciones a la base de datos. Para ello voy a usar Django, ya que es lo que vamos a usar también en la asignatura de Diseño de Aplicaciones de Internet.

##Segundo hito

[![Build Status](https://travis-ci.org/lorenmanu/submodulo-lorenzo.svg?branch=master)](https://travis-ci.org/lorenmanu/submodulo-lorenzo)

# Encuestas sitio web:

Es una aplicación que nos permite crear y votar encuestas. Para realizarla hemos seguido el tutorial de [Django](https://docs.djangoproject.com/en/1.8/intro/tutorial01/) , y la hemos usado para avanzar en la asignatura de Infraestructura Virtual y Desarrollo de Aplicaciónes de Internet.

##Uso

Una vez descargada la aplicación, para ejecutarla tenemos que dirigir a **submodulo-lorenzo-master/aplicacion/pollaplication/** y poner en la terminal **python manage.py runserver**:

![ejecucion](https://www.dropbox.com/s/oy66c3w7cxtxctm/img1.png?dl=1)

Para votar encuestas ponemos en nuestro navegador **http://127.0.0.1:8000** donde nos aparecerán todas las preguntas que hayamos creado( después diremos como las hemos creado):

![cuestiones](https://www.dropbox.com/s/59ub4jgzz3gj20a/img2.png?dl=1)

Seleccionamos una de las preguntas que aparecen:

![opciones](https://www.dropbox.com/s/al4a94ahj3ggo4k/img3.png?dl=1)

Tras esto, se almacenará nuestro voto:

![resultados](https://www.dropbox.com/s/j5372jejykzz880/img4.png?dl=1)


Para la creación de preguntas tenemos que jugar con la shell de python, tal y como se explica en el [tutorial](https://docs.djangoproject.com/en/1.8/intro/tutorial01/) ( en el apartado **Playing with the API**):

![crear_pregunta](https://www.dropbox.com/s/6nd7qal8w45l3u2/img5.png?dl=1)

Y podemos ver la pregunta:

![visualizacion_de_la_pregunta](https://www.dropbox.com/s/4l4dam1976mq9zg/img6.png?dl=1)

##Herramienta de construcción:
Para este segundo apartado del hito he creado un Makefile, con las siguientes opciones:

- clean: para borrar los archivos que se generan y no queremos. **make clean**

- install: instalará todo lo necesario para ejecutar la aplicación. **make install**

- test: que nos testeará la aplicación. **make test**

- run: nos ejecutará la aplicación. **make run**

- doc: nos generará la documentación. **make doc**

Mi mafefile es [este](Makefile):

~~~
#Makefile FJGM segundo hito 
#clean install test run doc

clean:
	- rm -rf *~*
	- find . -name '*.pyc' -exec rm {} \;

install: 
	python setup.py install
	
test: 
	python manage.py test
	
run:
	python manage.py runserver
doc:
	epydoc --html polls/*.py 
~~~

###Tests

Yo he escogido los tests como forma para realizar los proyectos, ya que me permiten comprobar la funcionalidad de los mismos conforme los vaya desarrollando.

Los test los he guardado en un archivo denominado **tests.py** , para ejecutarlos deberemos poner **python manage.y test**.


Mi archivo tests.py está [aquí](polls/tests.py). Ejemplo de ejecucp
![visualizacion](https://www.dropbox.com/s/ehluh1awb1kiijn/img10.png?dl=1)

Este fichero es inicial, ayudado del tutorial de django, la funcionalidad inicial básica que presenta esta pequeña aplicación se piensa mantener para nuestro proyecto, por eso lo he añadido como trabajo de mi proyecto.

###Integración continua

Para la integración contínua elegí [travis](https://travis-ci.org/) ya que es fácil de usar y entender( es similar a Shippable, también lo he probado).

En este apartado he creado un fichero llamado [setup.py](setup.py) y un fichero **.travis.ym**(el cual está en el directorio raíz).
Fichero [.travis.yml](.travis.yml):

~~~
language: python
python:
 - "2.7"
# command to install dependencies
install:
 - python aplicacion/setup.py install
 - pip install -r aplicacion/requirements.txt
# command to run tests4
script:
 - cd aplicacion/pollaplication
 - python manage.py test
~~~


Una vez creado estos dos archivos, con el Makefile y test.py también( de los apartados anteriores), he realizado los siguientes pasos:

- Registrarme en la página de travis e indicar el repositorio que queremos que compruebe.
- En nuestro repositorio de github, en el apartado **Setting/Webhooks&services** tenemos que activar el apartado de **Travis** y  pulsar **Test Service** para que inicie el test.

Saldrá algo así:

![travis](https://www.dropbox.com/s/uoyn00dq4dw8vph/img23.png?dl=1)

## Despliegue en un Paas
Esta práctica consistía en desplegar nuestra aplicación en un Paas. He decidido usar Heroku, por su facilidad en el uso y porque es el que he usado durante la realización de los ejercicios. También cabe destacar que es gratuito y permite usar el lenguage python y Framework Django, el cual usa nuestra aplicación).Para su despliegue he necesitado modificar o crear los siguientes ficheros:

- Procfile, el cual indica a heroku que tiene que lanzar:
```
web: gunicorn pollaplication.wsgi --log-file -

```
- requirements.txt: usado para especificar todo lo necesario para nuestra aplicación vaya, en mi caso es:
```
Django==1.8.6
argparse==1.2.1
dj-database-url==0.3.0
dj-static==0.0.6
django-toolbelt==0.0.1
djangorestframework==3.3.1
foreman==0.9.7
futures==3.0.3
gunicorn==19.3.0
psycopg2==2.6.1
requests==2.8.1
requests-futures==0.9.5
static3==0.6.1
wheel==0.26.0
whitenoise==2.0.4
wsgiref==0.1.2

```
Despues de esto nos registramos en Heroku. Una vez registrados tendríamos que ejecutar una serie de comandos que ahora se especifican, para lanzar nuestra aplicación en heroku:
```
wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh   
heroku login
heroku create
git add .
git commit -m "subida"
heroku apps:rename apuestas
git push heroku master

```
La base de datos que voy a usar en Heroku es **PostgreSQL**. Para ello:

- Tengo *psycopg2* para poder usarla.
- También tengo *dj_database_url*, tambien necesario para PostgreSQL.
- Edité el archivo *setting.py* del proyecto y añadí lo siguiente( sacado del siguiente [enlace](http://stackoverflow.com/questions/26080303/improperlyconfigured-settings-databases-is-improperly-configured-please-supply):
```

import dj_database_url

...

SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')
ALLOWED_HOSTS = ['*']
ON_HEROKU = os.environ.get('PORT')
if ON_HEROKU:
    DATABASE_URL='postgres://uhaxlowwnbgqrv:3decYI2il-srwwKVSDV6a4G-xQ@ec2-54-83-36-203.compute-1.amazonaws.com:5432/da2k9559f8odld'
    DATABASES = {'default': dj_database_url.config(default=DATABASE_URL)}


DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}

.....

STATIC_ROOT = 'staticfiles'
STATIC_URL = '/static/'

STATICFILES_DIRS = (
    os.path.join(BASE_DIR, 'static'),
)


```

- En **wsgi.py** puse lo siguiente:
```
import os

from django.core.wsgi import get_wsgi_application
from dj_static import Cling
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "apuestas.settings")

#from whitenoise.django import DjangoWhiteNoise
application = get_wsgi_application()


application = Cling(get_wsgi_application())
#application = DjangoWhiteNoise(application)
```
- Destacar que en DATABASE_URL se indica la url que sale para la base de datos postgreSQL que Heroku nos ofrece, hay que darle a show para verlo.
- Subí cambios a github y hacer **git push heroku master**.
- Ejecutar los comando **heroku run python manage.py makemigrations**, **heroku run python manage.py migrate** y **heroku run python manage.py createsuperuser** para sincronizar la base de datos PostgreSQL.
 
- Se añade el proceso de integración continua con snap-ci, para ello:

- Me he registrado en [https://snap-ci.com](https://snap-ci.com) y lo he conectado a mi repositorio:

![img10](https://www.dropbox.com/s/ndp34yqpdffh5gy/img10.png?dl=1)

- Compruebo que el repositorio esta conectado con **Github** y que tiene el despliegue automático ( consultar pestaña Deploy ).

![img11](https://www.dropbox.com/s/dv7x5s2ujo8miwv/img11.png?dl=1)

- Realizo un push al repositorio y compruebo que realiza el testeo antes de desplegarlo.

![img12](https://www.dropbox.com/s/wk9p9es5ucn3dj5/img12.png?dl=1)

- Cojo la etiqueta markdown de **Snap-ci** (pestaña Norificaciones).

![img13](https://www.dropbox.com/s/le7jab6le355ynu/img13.png?dl=1)


Con lo último(snap-ci), he realizado la integración continua de mi aplicación, cada vez que haga un push se pasarán los test y se desplegará mi aplicación.

-  Nota: **AVANCES**: la utilización de JSON con sus tests. Puede verse en el archivo **views.py**, su llamada en los **tests.py** y el archivo **serializers.py**.










