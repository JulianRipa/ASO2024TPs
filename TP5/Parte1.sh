#!/bin/bash

# Genera un número aleatorio entre 1 y 100
numero_aleatorio=$(( ( RANDOM % 100 ) + 1 ))
intentos=0
adivinado=false

echo "---- Juego de Adivinanzas de un Numero----"
echo " intente con un numero entre 1 y 100. ¡Intenta adivinarlo!"

# Bucle principal para adivinar el número
while [ "$adivinado" = false ]; do
    read -p "ingresa el intento:  " intento
    intentos=$((intentos + 1))

    if [ "$intento" -lt "$numero_aleatorio" ]; then
        echo "el numero es mas alto :), Intenta de nuevo!"
    elif [ "$intento" -gt "$numero_aleatorio" ]; then
        echo "el valor es mas bajo :) , Intenta de nuevo!"
    else
        adivinado=true
        echo "¡Muy Bieeen ! adivinaste el número en $intentos intentos."
    fi
done
