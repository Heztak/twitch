#!/bin/bash

# Comprobar si el script se ejecuta como root
if [ "$EUID" -ne 0 ]
then 
  echo "Por favor, ejecuta este script como superusuario (root)"
  exit
fi

# Comprobar si Docker está instalado y actualizarlo, o instalarlo si no está presente
if command -v docker &> /dev/null
then
    echo "Docker ya está instalado. Actualizando..."
    yum update -y docker-ce docker-ce-cli containerd.io
else
    echo "Docker no está instalado. Instalando..."
    yum install -y yum-utils
    yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    yum install -y docker-ce docker-ce-cli containerd.io
fi

# Iniciar y habilitar Docker
systemctl start docker.service
systemctl enable docker.service

# Agregar el usuario actual al grupo docker
usermod -aG docker $(whoami)
