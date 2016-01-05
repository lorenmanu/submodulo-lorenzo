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

### Herramienta de Construcción

Para este apartado proporciono un makefile para automatizar las tareas:

```
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
	epydoc --html MiTienda/*.py 


```

###Instalación local de la aplicación

Para ejecutar la aplicación de manera local, tendremos que introducir los siguientes comandos en la terminal:

- Clonar el repositorio de la aplicación:

```
git clone https://github.com/lorenmanu/submodulo-lorenzo.git

```
- Dirigirnos al nuevo escritorio creado:

```
cd submodulo-lorenzo

```
- Sincronización de la base de datos:

```
python manage.py makemigrations
python manage.py migrate

```

- Creación del usuario de la base de datos:

```
python manage.py createsuperuser

```

- Ejecución del servidor:

```

python manage.py runserver


```


Como se puede ver hago uso del archivo **manage.py**, el cual me permitirá realizar diferentes tareas, las cuales entre otras son:

- **python manage.py runserver**: ejecuta el servidor.
- **python manage.py createsuperuser**:crea un usuario para la base de datos.
- **python manage.py test**: ejecutará los test de nuestra aplicación.
- **python manage.py makemigrations && python manage.py migrate**: para sincronizar la base de datos.

###Integración Continua

Aquí he usado dos sistemas de integración continua, de esta manera cada vez que realice un cambio en la aplicación se comprobará su correcto funcionamento. Los sistemas usados son:

- **Travis**: estará sincronizado con nuestro repositorio, cada vez que se realice un cambio en la aplicación comprobará el correcto funcionamiento de esta.

- **Snap-Ci**: usado para heroku, lo veremos en el siguiente apartado.

###Despliegue en un Paas Heroku

Aquí he decidido usar Heroku, el cual se caracteriza por su fácil sincronización con github y por su caracter gratuito.






