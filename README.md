## **Proyecto de IV(infraestructura Virtual junto con DAI(DESARROLO DE APLICACIONES DE INTERNET** ##


**El módulo 3:** [( Lorenzo Manuel Rosas Rodríguez )](https://github.com/lorenmanu/submodulo-lorenzo): Este módulo implementará el sistema web, por lo que se encargará de la interfaz gráfica de la misma así como de la parte que lanzará peticiones de operaciones a la base de datos. Para ello voy a usar Django, ya que es lo que vamos a usar también en la asignatura de Diseño de Aplicaciones de Internet.

##Segundo hito

###Tests

Yo he escogido los tests como forma para realizar los proyectos, ya que me permiten comprobar la su funcionalidad conforme los vaya desarrollando.

Los test los he guardado en un archivo denominado **tests.py** , para ejecutarlos deberemos poner **python manage.y test**.
![ejec_test]


Mi archivo tests.py es: ![aquí](https://github.com/lorenmanu/submodulo-lorenzo/blob/master/aplicacion/pollaplication/polls/tests.py)

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

