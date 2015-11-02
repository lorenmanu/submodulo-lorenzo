## **Proyecto de IV(infraestructura Virtual junto con DAI(DESARROLO DE APLICACIONES DE INTERNET** ##

###Breve Descripción/Introducción:

El proyecto consiste en una plataforma de compra/venta de productos on-line. La plataforma contiene varias secciones para la venta de todo tipo de productos. La plataforma consiste en una página web donde cualquiera podra ver los productos que se venden, pero para poder vender o comprar será necesario registro. Si el vendedor se encuentra conectado, cualquier comprador potencial podrá chatear con el para preguntarle sobre el productos.

Cada anuncio vendra acompañado de una foto y una descripcion del producto que se ajuste a la realidad. Cada producto deberá estar bien situado en su sección correspondiente.

Cada usuario podrá tener una lista de productos favoritos.

Habrá moderadores que podrán eliminar cualquier anuncio de material fuera de la ley o que no se ajuste a la política de la plataforma.

La plataforma albergará un foro donde poder opinar sobre las diferentes transacciones.

**El módulo  Lorenzo Manuel Rosas Rodríguez**: Este módulo implementará el sistema web, por lo que se encargará de la interfaz gráfica de la misma así como de la parte que lanzará peticiones de operaciones a la base de datos. Para ello voy a usar Django, ya que es lo que vamos a usar también en la asignatura de Diseño de Aplicaciones de Internet.

##Segundo hito

# Encuestas sitio web:

Es una aplicación que nos permite crear y votar encuestas. Para realizarla hemos seguido un tutorial el tutorial de [Django](https://docs.djangoproject.com/en/1.8/intro/tutorial01/) , y la hemos usado para avanzar en la asignatura de Infraestructura Virtual y Desarrollo de Aplicaciónes de Internet.

##Uso

Una vez descargada la aplicación, para ejecutarla nos tenemos que dirigir a **submodulo-lorenzo-master/aplicacion/pollaplication/** y poner en la terminal **python manage.py runserver**:

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
-clean: para borrar los archivos que se generan y no queremos. **make clean**

-install: instalará todo lo necesario para ejecutar la aplicación. **make install**

-test: que nos testeará la aplicación. **make test**

-run: nos ejecutará la aplicación. **make run**

-doc: nos generará la documentación. **make doc**

###Tests

Yo he escogido los tests como forma para realizar los proyectos, ya que me permiten comprobar la su funcionalidad conforme los vaya desarrollando.

Los test los he guardado en un archivo denominado **tests.py** , para ejecutarlos deberemos poner **python manage.y test**.


Mi archivo tests.py está [aquí](aplicacion/pollaplication/polls/tests.py).

Este fichero es inicial, ayudado del tutorial de django, la funcionalidad inicial básica que presenta esta pequeña aplicación se piensa mantener para nuestro proyecto, por eso lo he añadido como trabajo de mi proyecto.

###Integración continua

Para la integración contínua elegí [travis](https://travis-ci.org/) ya que es fácil de usar y entender( es similar a Shippable, también lo he probado).

Para poder usar travis:

-He creado un fichero llamado [setup.py](aplicacion/setup.py)

También he creado un fichero **.travis.ym**, el cual está en el directorio raíz.
Fichero travis.yml:

~~~
language: python
python:
 - "2.7"
# command to install dependencies
install:
 - python aplicacion/setup.py install
 - pip install -r aplicacion/requirements.txt
# command to run tests
script:
 - cd aplicacion/pollaplication
 - python manage.py test
~~~


Una vez subido a github, e indicado travis que trabaje con repositorio correspondiente debe salir esto:

![travis](https://www.dropbox.com/s/uoyn00dq4dw8vph/img23.png?dl=1)
![admin](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/pollaplication/admin_zps4vvtzbcr.png)
