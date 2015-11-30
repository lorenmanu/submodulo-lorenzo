[![Build Status](https://travis-ci.org/lorenmanu/submodulo-lorenzo.svg?branch=master)](https://travis-ci.org/lorenmanu/submodulo-lorenzo)

[![Build Status](https://snap-ci.com/lorenmanu/submodulo-lorenzo/branch/master/build_image)](https://snap-ci.com/lorenmanu/submodulo-lorenzo/branch/master)

[![Heroku](https://www.herokucdn.com/deploy/button.png)](https://combook.herokuapp.com/)


## **Proyecto de IV(infraestructura Virtual) junto con DAI(DESARROLLO DE APLICACIONES DE INTERNET** ##

###Breve Descripción/Introducción:

El proyecto consiste en una plataforma de compra/venta de productos on-line. La plataforma contiene varias secciones para la venta de todo tipo de productos. La plataforma consiste en una página web donde cualquiera podrá ver los productos que se venden, pero para poder vender o comprar será necesario registro. Si el vendedor se encuentra conectado, cualquier comprador potencial podrá chatear con el para preguntarle sobre el productos.

Cada anuncio vendrá acompañado de una foto y una descripción del producto que se ajuste a la realidad. Cada producto deberá estar bien situado en su sección correspondiente.

Cada usuario podrá tener una lista de productos favoritos.

Habrá moderadores que podrán eliminar cualquier anuncio de material fuera de la ley o que no se ajuste a la política de la plataforma.

La plataforma albergará un foro donde poder opinar sobre las diferentes transacciones.

**El módulo  Lorenzo Manuel Rosas Rodríguez**: Este módulo implementará el sistema web, por lo que se encargará de la interfaz gráfica de la misma así como de la parte que lanzará peticiones de operaciones a la base de datos. Para ello voy a usar Django, ya que es lo que vamos a usar también en la asignatura de Diseño de Aplicaciones de Internet.


# Encuestas sitio web:

Es una aplicación que nos permite crear y votar encuestas. Para realizarla hemos seguido el tutorial de [Django](https://docs.djangoproject.com/en/1.8/intro/tutorial01/) , y la hemos usado para avanzar en la asignatura de Infraestructura Virtual y Desarrollo de Aplicaciones de Internet.

##Uso

Una vez descargada la aplicación, para ejecutarla tenemos que dirigir a **submodulo-lorenzo-master/aplicacion/gestionapp/** y poner en la terminal **python manage.py runserver**:

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
Como herramienta de construcción yo he escogido un Makefile, con las siguientes opciones:

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
	epydoc --html COMBOOK/*.py 
~~~

###Tests

Yo he escogido los tests como forma para realizar los proyectos, ya que me permiten comprobar la funcionalidad de los mismos conforme los vaya desarrollando.

Los test los he guardado en un archivo denominado **tests.py** , para ejecutarlos deberemos poner **python manage.y test**.


Mis archivo tests.py está [aquí](apps/autores/tests.py). Al avanzar la aplicación tengo otro en la página de [inicio](apps/inicio/tests.py). Cada app que hemos creado con **django-admi.py start app "nombre_app"** tendrá su propio test.py, donde realizaremos operaciones con las aplicaciones respectivas. Ejemplo de ejecución:
![visualizacion](https://www.dropbox.com/s/ehluh1awb1kiijn/img10.png?dl=1)

La imagen anterior es del comienzo de desarrollo, es decir, cuando nuestra aplicación era más simple, ahora contamos con más operaciones ya que hemos aumentado considerablemente la funcionalidad de nuestra aplicación, como veremos más adelante.

###Integración continua

Para la integración continua elegí [travis](https://travis-ci.org/) ya que es fácil de usar y entender( es similar a Shippable, también lo he probado).

En este apartado he creado un fichero llamado [setup.py](setup.py) y un fichero **.travis.ym**(el cual está en el directorio raíz).
Fichero [.travis.yml](.travis.yml):

~~~
language: python
python:
 - "2.7.6"
# command to install dependencies
install:
 - python setup.py install
 - sudo pip install --upgrade pip
 - pip install -r requirements.txt
# command to run tests
script:
 - python manage.py test
~~~


Una vez creado estos dos archivos, con el Makefile y test.py también( de los apartados anteriores), he realizado los siguientes pasos:

- Registrarme en la página de travis e indicar el repositorio que queremos que compruebe.
- En nuestro repositorio de github, en el apartado **Setting/Webhooks&services** tenemos que activar el apartado de **Travis** y  pulsar **Test Service** para que inicie el test.

Saldrá algo así:

![travis](https://www.dropbox.com/s/uoyn00dq4dw8vph/img23.png?dl=1)



## Despliegue en un Paas
Esta práctica consistía en desplegar nuestra aplicación en un Paas. He decidido usar Heroku, por su facilidad en el uso y porque es el que he usado durante la realización de los ejercicios. También cabe destacar que es gratuito y permite usar el lenguaje python y Framework Django, el cual usa nuestra aplicación).Para su despliegue he necesitado modificar o crear los siguientes ficheros:

- Procfile, el cual indica a heroku que tiene que lanzar:
```
web: gunicorn COMBOOK.wsgi --log-file -

```
- [requirements.txt](requirements.txt): usado para especificar todo lo necesario para nuestra aplicación vaya. Se puede escribir en el indicando en la terminal **pip freeze > requirements.txt**, esta forma es la cual he realizado yo, pero da problemas con dependencias, los he resuelto introduciendo dichos problemas en internet, debido a su cantidad no los indicaré, durante esta semana yo y mis mienbros de grupo intentaremos resolverlo de manera que al poner dicho comando en la terminal no nos de ningún problema.

Después de esto nos registramos en Heroku. Una vez registrados tendríamos que ejecutar una serie de comandos que ahora se especifican, para lanzar nuestra aplicación en heroku:

- Descargar del toolbelt de heroku, este comando es para ubuntu, para OSX hay que descargarse el correspondiente ".dmg"

```

wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh   

```

- Realizar login(con las datos respectivos que hemos introducido en el registro, el cual se realiza en la página oficial de heroku).

```

heroku login

```


- Crear la aplicación:
```

heroku create

```

- Una vez que realizados los cambios en nuestra aplicación, subirlos a heroku de la siguiente forma: 

```

git add .
git commit -m "subida"
git push heroku master

```
- Indicar que se quiere usar una base de datos( ya creada en heroku)**PostgreSQL**. Para ello, editar el archivo settings.py de nuestra aplicación e introducir:

```

import dj_database_url

...

SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')
ALLOWED_HOSTS = ['*']
ON_HEROKU = os.environ.get('PORT')
if ON_HEROKU:
    DATABASE_URL=' postgres://qcgsjyjlrxrbut:AB6HfA2cXIV74B8z_xKl-V88vI@ec2-107-21-219-109.compute-1.amazonaws.com:5432/df1bb3foip112r'
    DATABASES = {'default': dj_database_url.config(default=DATABASE_URL)}


DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}

...

STATIC_ROOT = 'staticfiles'
STATIC_URL = '/static/'

STATICFILES_DIRS = (
    os.path.join(BASE_DIR, 'static'),
)


```

- En **wsgi.py** poner lo siguiente:
```

import os

from django.core.wsgi import get_wsgi_application
from dj_static import Cling
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "COMBOOK.settings")

#from whitenoise.django import DjangoWhiteNoise
application = get_wsgi_application()


application = Cling(get_wsgi_application())
#application = DjangoWhiteNoise(application)

```

Con respecto al último paso, que ha sido el de indicar que se quiere usar la base de datos de heroku, cabe indicar las siguientes cosas:

- En DATABASE_URL se indica la url de la base de datos postgreSQL de Heroku( que deberemos haber creado antes), hay que darle a show para verlo.

- Siempre que introduzcamos nuevos modelos en los archivos **models.py** o introduzcamos nuevos datos, deberemos escribir los siguientes comandos en la terminal: **heroku run python manage.py makemigrations**, **heroku run python manage.py migrate** y **heroku run python manage.py createsuperuser**. De esta manera se sincronizará la base de datos PostgreSQL de heroku. En versiones anteriores de django se permitía realizar los pasos anteriores con **python manage.py syncdb**, en las nuevas se permite, pero el mismo django te recomienda al usar el último comando que no lo uses.

Aplicación [desplegada](https://combook.herokuapp.com/).

Hemos añadido un archivo **.sh** para realizar el despligue de la aplicacion, puede verse [aquí](despligue.sh). Para realizarlo nos hemos servido del siguiente [enlace](https://github.com/iblancasa/BackendSI2-IV/wiki/DespliegueHeroku), el cual nos conducía a otros enlaces de heroku, los cuales hemos usado para contrastar ideas.

Se añade el proceso de integración continua con snap-ci, para ello:

- Me he registrado en [https://snap-ci.com](https://snap-ci.com) y lo he conectado a mi repositorio:

![img10](https://www.dropbox.com/s/ndp34yqpdffh5gy/img10.png?dl=1)

- Compruebo que el repositorio esta conectado con **Github** y que tiene el despliegue automático ( consultar pestaña Deploy ).

![img11](https://www.dropbox.com/s/dv7x5s2ujo8miwv/img11.png?dl=1)

- Realizo un push al repositorio y compruebo que realiza el testeo antes de desplegarlo.

![img12](https://www.dropbox.com/s/wk9p9es5ucn3dj5/img12.png?dl=1)

- Cojo la etiqueta markdown de **Snap-ci** (pestaña Notificaciones).

![img13](https://www.dropbox.com/s/le7jab6le355ynu/img13.png?dl=1)


Con lo último(snap-ci), he realizado la integración continua de mi aplicación, cada vez que haga un push se pasarán los test y se desplegará mi aplicación.


-  Nota: **AVANCES**: se pueden ver en el [avances.md](avances.md).










