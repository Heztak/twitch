# Bienvenido a YouTube-to-Twitch 

Este proyecto te permite transmitir contenido de YouTube a Twitch utilizando Docker. A continuación, se detallan los pasos para instalar y ejecutar este proyecto.

---

## Pre-requisitos

Antes de comenzar, asegúrate de tener Docker instalado en tu sistema. Si no lo tienes, puedes seguir los pasos correspondientes según tu distribución. 

---

## Instalación de Docker 

Para instalar Docker en Ubuntu, puedes utilizar el siguiente script: 

```shell
$ ./install_docker.sh

Creación de la Imagen Docker
Una vez que Docker esté instalado, puedes crear la imagen Docker para este proyecto ejecutando el siguiente comando:

shell
Copy code
$ docker build -t youtube-to-twitch .

Ejecución del Proyecto
Finalmente, para ejecutar la imagen, utiliza el siguiente script:

shell
Copy code
$ ./ejecutar.sh
Nota: Es recomendable ejecutar el script con privilegios de usuario root para evitar posibles problemas. Si decides no utilizar el usuario root, asegúrate de otorgar los permisos necesarios.

Esperamos que encuentres este proyecto útil. Si tienes algún problema, por favor abre un Issue en este repositorio.
