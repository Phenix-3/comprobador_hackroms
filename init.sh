#!/bin/bash

set -e # salir en caso de que algo salga mal (primera vez que lo uso)

# ver si estas en el grupo docker
if docker ps &> /dev/null
then
	CMD="docker"

elif sudo -n docker ps &> /dev/null # si no lo estas compruebo que puedas ejecutarlo como sudo
then
	CMD="sudo docker"
else
	echo "Falta instalar docker, porfavor instalelo en su sistema operativo o no tiene usted privilegios suficientes para utilizarlo."
	exit 1
fi

# construir imagen
docker build -t bot-hackroms-go . &> /dev/null

# ejecutar imagen
docker run --rm -v $(pwd):/data bot-hackroms-go
