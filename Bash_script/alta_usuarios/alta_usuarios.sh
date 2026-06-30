#!/bin/bash
clear

###############################
# Parametros:
#  - Lista de Usuarios a crear (usuario,grupo,home)
#  - Usuario del cual se obtendra la clave
###############################

LISTA=$1
USUARIO_BASE=$2

# Obtener el hash de la clave del usuario base
CLAVE=$(sudo grep "^$USUARIO_BASE:" /etc/shadow | awk -F ':' '{print $2}')

ANT_IFS=$IFS
IFS=$'\n'
for LINEA in $(grep -v ^# "$LISTA")
do
    USUARIO=$(echo "$LINEA" | awk -F ',' '{print $1}')
    GRUPO=$(echo "$LINEA"   | awk -F ',' '{print $2}')
    HOME=$(echo "$LINEA"    | awk -F ',' '{print $3}')

    # Crear usuario con grupo, home y misma clave
    sudo useradd -m -s /bin/bash -g "$GRUPO" -d "$HOME" -p "$CLAVE" "$USUARIO"
done
IFS=$ANT_IFS