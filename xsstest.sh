#!/bin/bash

Normal=$(echo 'printf' '\033[39m')
Negro=$(echo 'printf' '\033[30m')
Azul=$(echo 'printf' '\033[34m')
Cyan=$(echo 'printf' '\033[36m')
Gris=$(echo 'printf' '\033[90m')
Verde=$(echo 'printf' '\033[32m')
Magenta=$(echo 'printf' '\033[35m')
Rojo=$(echo 'printf' '\033[31m')
Blanco=$(echo 'printf' '\033[0m')
BlancoAlt=$(echo 'printf' '\033[97m')
Amarillo=$(echo 'printf' '\033[33m')

$Verde
cat << "INFO"
    __   __ _____ _____ _            _
    \ \ / // ____/ ____| |          | |
     \ V /| (___| (___ | |_ ___  ___| |_
      > <  \___ \\___ \| __/ _ \/ __| __|
     / . \ ____) |___) | ||  __/\__ \ |_
    /_/ \_\_____/_____/ \__\___||___/\__| Beta
INFO
$BlancoAlt
echo "                  hackingyseguridad.com"
echo
$Blanco
if [ -z "$1" ]; then
        echo "Test vulnerabilidad XSS url web."
        echo "Uso: $0 <URL>"
        exit 0
fi

echo
echo "==========================================="
echo "test xss sobre la url.: $1"
echo "==========================================="
echo
$BlancoAlt
for n in `cat diccionario.txt`
do
        fqdn=$1"/"$n
        if curl $fqdn -I --silent|grep "200 OK"
        then echo $fqdn
        fi
done
$Normal
