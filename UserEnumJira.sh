#!/bin/bash

echo ""
echo "        ╦ ╦┌─┐┌─┐┬─┐╔═╗┌┐┌┬ ┬┌┬┐"
echo "        ║ ║└─┐├┤ ├┬┘║╣ ││││ ││││"
echo "        ╚═╝└─┘└─┘┴└─╚═╝┘└┘└─┘┴ ┴"
echo "      Escrito por Juampa Rodríguez      "
echo "----------------------------------------"

output=$(curl -s "https://"$1"/activity" | sed 's/<name>/\n Nombre: /g' | sed 's/<\/uri>/\n/g' | grep "Nombre:" | sort | uniq)

if [ -z $1 ]
    then echo -e "\n\tUso: ./UserEnumJira.sh TARGET\n"
    exit 0
    fi
    if [[ $output == *"?name="* ]];
        then echo $output | sed 's/name=/\n Username: /g' | sed 's/<\/name><email>/\n Email: /g' | sed 's/<\/email><uri>/\n/g' | grep -v http | sed 's/Nombre:/\n\n Nombre:/g'
        else echo $output | sed 's/display\/~/\n Username: /g' | sed 's/<\/name><email>/\n Email: /g' | sed 's/<\/email><uri>/\n/g' | grep -v http | sed 's/Nombre:/\n\n Nombre:/g'
        fi
echo -e "\n----------------------------------------"
