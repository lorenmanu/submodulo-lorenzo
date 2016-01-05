## Cambios realizados en este último hito

- Reorganización del archivo README, para ello se crea la carpeta **documentacion** como apoyo de dicho archivo. 
- Utilización de PostgreSQL en Heroku
- Se crea una imagen de un sistema Ubuntu conteniendo la aplicación en [DockerHub](https://hub.docker.com/r/javiergarridomellado/iv_javiergarridomellado/).
- Se añade un script que permite instalar Docker, descargar y lanzar la imagen de la aplicación, [docker_install_and_run](https://github.com/javiergarridomellado/IV_javiergarridomellado/blob/master/scripts/docker_install_and_run.sh)
- Se añade un script que permite desplegar la aplicación en Heroku, [heroku_deploy.sh](https://github.com/javiergarridomellado/IV_javiergarridomellado/blob/master/scripts/heroku_deploy.sh)
- Se añade un script que permite arrancar la aplicación en local, [run_app.sh](https://github.com/javiergarridomellado/IV_javiergarridomellado/blob/master/scripts/run_app.sh)
- Se añade archivo fabfile para el despliegue del contenedor en Azure.
- Se añade como se ha configurado máquina virtual Ubuntu en Azure.
