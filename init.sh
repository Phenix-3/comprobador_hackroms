#!/bin/bash

set -e 

# ver si estas en el grupo docker
if docker ps &> /dev/null
then
	CMD="docker"

elif sudo -n docker ps &> /dev/null
then
	CMD="sudo docker"
else
	echo "Falta instalar docker, porfavor instalelo en su sistema operativo."
	exit 1
fi

# construir imagen
docker build -t bot-hackroms-go . &> /dev/null

# ejecutar imagen
docker run --rm -v $(pwd):/data bot-hackroms-go
