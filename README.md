[![Build Status](https://travis-ci.org/lorenmanu/submodulo-lorenzo.svg?branch=master)](https://travis-ci.org/lorenmanu/submodulo-lorenzo)

[![Build Status](https://snap-ci.com/lorenmanu/submodulo-lorenzo/branch/master/build_image)](https://snap-ci.com/lorenmanu/submodulo-lorenzo/branch/master)

[![Heroku](https://www.herokucdn.com/deploy/button.png)](https://myclient.herokuapp.com/)


## **Proyecto de IV(infraestructura Virtual) junto con DAI(DESARROLLO DE APLICACIONES DE INTERNET)** ##

###Breve Descripción/Introducción:

El proyecto consiste en una plataforma de compra/venta de productos on-line. La plataforma contiene varias secciones para la venta de todo tipo de productos. La plataforma consiste en una página web donde cualquiera podrá ver los productos que se venden, pero para poder vender o comprar será necesario registro. Si el vendedor se encuentra conectado, cualquier comprador potencial podrá chatear con el para preguntarle sobre el productos.

Cada anuncio vendrá acompañado de una foto y una descripción del producto que se ajuste a la realidad. Cada producto deberá estar bien situado en su sección correspondiente.

Cada usuario podrá tener una lista de productos favoritos.

Habrá moderadores que podrán eliminar cualquier anuncio de material fuera de la ley o que no se ajuste a la política de la plataforma.

La plataforma albergará un foro donde poder opinar sobre las diferentes transacciones.

**El módulo  Lorenzo Manuel Rosas Rodríguez**: Este módulo implementará el sistema web, por lo que se encargará de la interfaz gráfica de la misma así como de la parte que lanzará peticiones de operaciones a la base de datos. Para ello voy a usar Django, ya que es lo que vamos a usar también en la asignatura de Diseño de Aplicaciones de Internet.


##Herramienta de construcción:
Yo he elegido en mi proyecto como herramienta de construcción usar Makefile, ya que lo he usado a lo largo de mi titulación. Además de ello porque nos permite avanzar en nuestro sin modificar este archivo. Tendré las siguientes opciones:

- clean: para borrar los archivos que se generan y no queremos. **make clean**

- install: instalará todo lo necesario para ejecutar la aplicación. **make install**

- test: que nos testeará la aplicación. **make test**

- run: nos ejecutará la aplicación. **make run**

- doc: nos generará la documentación. **make doc**

Mi mafefile es [este](Makefile):

###Tests

Aquí usaré  los tests, cuya finalidad será comprobar la funcionalidad de mi aplicción conforme la vaya desarrollando, es decir, cada vez que hagamos un **git push** se comprobará si nuestra aplicación se ejecuta correctamente( esto último a sincronizarlo con travis, lo veremos depués).

Al tener dos aplicaciones en mi proyecto, tendré dos test, uno para mi aplicación productos y otro para mi aplicación inicio:

- Test para [productos](apps/productos/tests.py).
- Test para [inicio](apps/inicio/tests.py).


###Integración continua

Aquí he escogido [travis](https://travis-ci.org/). Como he dicho antes, cada vez que realice un **git push** se comprobará el correcto funcionamiento de mi aplicación. Los archivos creados para poder usar travis son:
- [setup.py](setup.py).
- [.travis.yml](.travis.yml).


- Registrarme en la página de travis e indicar el repositorio que queremos que compruebe.
- En nuestro repositorio de github, en el apartado **Setting/Webhooks&services** tenemos que activar el apartado de **Travis** y  pulsar **Test Service** para que inicie el test.

Una vez regitrados en travis, indicado el repositorio que queremos que se utilice y haber puesto en el apartado **Setting/Webhooks&services** que tenemos que activar el apartado de **Travis** y  pulsar **Test Service** para que inicie el test, nos saldrá algo como lo siguiente;

![travis](https://www.dropbox.com/s/uoyn00dq4dw8vph/img23.png?dl=1)



## Despliegue en un Paas
 Como Paas he usado Heroku, porque es el que he trabajo durante la realización de los ejercicios. Sobre sus características más reseñables destaco que es gratuito y permite usar el lenguaje python y Framework Django (el cual usa nuestra aplicación). Es necesario para realizar este apartado crear o modificar los siguientes archivos:

- [Procfile](Profile): para indicar a heroku que tiene que lanzar.

- [requirements.txt](requirements.txt): especifica todo lo que es necesario instalar.

El siguiente paso es registrarse en Heroku. Una vez realizado el registro se tendría que ejecutar desde la máquina local una serie de comandos, los especificaremos en el siguiente [archivo](heroku.md):


Mi aplicación desplegada puede verse[aquí](https://MiTienda.herokuapp.com/).

Además he añadido un archivo denominado para desplegar la aplicación, el cual es el [este](despliegue.sh).
Si se tiene alguna duda sobre este archivo puede verse este [enlace](https://github.com/iblancasa/BackendSI2-IV/wiki/DespliegueHeroku).

También he usado para la integración continua snap-ci. Así cada vez que realiza un **git push** se comprobará la correcta funcionalidad de mi aplicación pasando los tests y posteriormente se desplegará. La sincronización de mi repositorio con travis puede verse [aquí](snap-ci.md):


Nota: **AVANCES**: se pueden ver en el [avances.md](avances.md).










