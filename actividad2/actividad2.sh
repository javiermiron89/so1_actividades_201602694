#!/bin/bash

#Se solicita el usuario de git y se almacena en la variable GITHUB_USER
echo "Hola! Ingresa el usuario de GITHUB: "
read GITHUB_USER

#Se obtiene el contenido del usuario de github mediante la API de GitHub
content=$(curl -L https://api.github.com/users/$GITHUB_USER)
#Almacenamos el usuario
github_user=$(echo $content | jq '.login')
#Luego el id de usuario
id=$(echo $content | jq '.id')
#Obtenemos la fecha de creacion
created_at=$(echo $content | jq '.created_at')
clear
#Mostramos el mensaje final 
mensaje=$(echo "Hola $github_user. User ID: $id. Cuenta creada el: $created_at")
echo $mensaje

#Generacion del LOG
fechaEjecucion=$(date +"%F")
mkdir -p /tmp/$fechaEjecucion
echo "$mensaje" >> /tmp/$fechaEjecucion/saludos.log