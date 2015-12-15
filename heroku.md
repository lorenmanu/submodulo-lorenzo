

## **Como subir nuestra aplicación a heroku** ##



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
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "MiTienda.settings")

#from whitenoise.django import DjangoWhiteNoise
application = get_wsgi_application()


application = Cling(get_wsgi_application())
#application = DjangoWhiteNoise(application)

```

Con respecto al último paso, que ha sido el de indicar que se quiere usar la base de datos de heroku, cabe indicar las siguientes cosas:

- En DATABASE_URL se indica la url de la base de datos postgreSQL de Heroku( que deberemos haber creado antes), hay que darle a show para verlo.

- Siempre que introduzcamos nuevos modelos en los archivos **models.py** o introduzcamos nuevos datos, deberemos escribir los siguientes comandos en la terminal: **heroku run python manage.py makemigrations**, **heroku run python manage.py migrate** y **heroku run python manage.py createsuperuser**. De esta manera se sincronizará la base de datos PostgreSQL de heroku. En versiones anteriores de django se permitía realizar los pasos anteriores con **python manage.py syncdb**, en las nuevas se permite, pero el mismo django te recomienda al usar el último comando que no lo uses.