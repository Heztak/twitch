## Instrucciones de instalación

Antes de comenzar, asegúrate de tener Docker instalado en tu sistema. Si no lo tienes, puedes seguir los pasos correspondientes según tu distribución:

- Para Ubuntu, ejecuta el siguiente script:
  ```shell
  $ ./install_docker.sh

Una vez que Docker esté instalado, puedes crear la imagen Docker ejecutando el siguiente comando:
  ```shell
$ docker build -t youtube-to-twitch .

Finalmente, para ejecutar la imagen, utiliza el siguiente script:
  ```shell
$ ./ejecutar.sh

Es recomendable ejecutar el script con privilegios de usuario root para evitar posibles problemas. Si decides no utilizar el usuario root, asegúrate de otorgar los permisos necesarios.
