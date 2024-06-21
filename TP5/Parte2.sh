#!/bin/bash

echo "Ingrese un nombre para verificar el género probable:"
read nombre

URL="https://api.genderize.io/?name=$nombre"

respuesta=$(curl -s "$URL")

if [[ $? -ne 0 ]]; then
  echo "Error al conectarse a la API. Por favor, verifica tu conexión a internet."
  exit 1
fi

nombre_respuesta=$(echo "$respuesta" | jq -r '.name')
genero=$(echo "$respuesta" | jq -r '.gender')

if [[ "$genero" == "null" ]]; then
  echo "No se pudo determinar el género para el nombre '$nombre'."
else
  if [[ "$genero" == "male" ]]; then
    genero="masculino"
  fi
  echo "Para el nombre '$nombre', el género probable es '$genero'."
fi
