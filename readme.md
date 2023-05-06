**Requisitos**

Tener instalado Docker, si no lo tienes ejecuta el script install_docker.sh para versiones ubuntu
si tienes centos/redhat ejecuta install_docker_centosredhat.sh
luego docker build -t youtube-to-twitch .
para hacer la imagen
finalmente ejecuta ejecutar.sh
se recomienda usar con usuario root, ya que, asi se evitan problemas pero si no, solo otorgen los permisos necesarios.

**Future features**

Autodetectar si la transmisión ha dejado de funcionar y obtener automáticamente una nueva desde el mismo canal, en caso de que la transmisión haya finalizado, buscar la siguiente transmisión en vivo del mismo canal de YouTube y comenzar a copiarla y transmitirla en Twitch.