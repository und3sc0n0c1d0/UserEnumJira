#!/bin/bash
#v2.2 [2020-11-14]

echo -e "\e[94m"
echo "        ╦ ╦┌─┐┌─┐┬─┐╔═╗┌┐┌┬ ┬┌┬┐"
echo "        ║ ║└─┐├┤ ├┬┘║╣ ││││ ││││"
echo "        ╚═╝└─┘└─┘┴└─╚═╝┘└┘└─┘┴ ┴"
echo -e "      Escrito por Juampa Rodríguez      \e[0m"
echo "----------------------------------------"

if [ -z $1 ]
    then echo -e "\n \e[31m[-]\e[0m Uso: ./UserEnumJira.sh http(s)://TARGET/\n"
    exit 0
elif [[ "$1" != "http"* ]]
then
  echo -e "\n \e[31m[-]\e[0m Sintaxis incorrecta. Se debe indicar el protocolo http(s)"
  echo -e "\n \e[31m[-]\e[0m Uso: ./UserEnumJira.sh http(s)://TARGET/\n"
  exit 0
elif [[ "$1" != *"/" ]]
then
  echo -e "\n \e[31m[-]\e[0m Sintaxis incorrecta. La URL debe finalizar con '/'"
  echo -e "\n \e[31m[-]\e[0m Uso: ./UserEnumJira.sh http(s)://TARGET/\n"
  exit 0
else
output=$(curl -sk $1"activity" | sed 's/<name>/\nNombre: /g' | sed 's/<\/uri>/\n/g' | grep "Nombre:" | grep -v "</name></author>" | sort | uniq)
count=$(echo $output | sed 's/Nombre:/\n\n Nombre:/g' | grep "Nombre" | wc -l)
if [ "${output:-0}" == 0 ]
    then echo -e "\n \e[33m[!]\e[0m No hay resultados para la URL indicada"
    echo -e "\n----------------------------------------"
    exit 0
fi
if [[ $output == *"?name="* ]]
    then echo $output | sed 's/name=/\n Username: /g' | sed 's/<\/name><email>/\n Email: /g' | sed 's/<\/email><uri>/\n/g' | grep -v http | sed 's/Nombre:/\n\n Nombre:/g'
    echo -e "\n \e[32m[+]\e[0m Cantidad de datos de usuarios identificados:" $count
    else echo $output | sed 's/display\/~/\n Username: /g' | sed 's/<\/name><email>/\n Email: /g' | sed 's/<\/email><uri>/\n/g' | grep -v http | sed 's/Nombre:/\n\n Nombre:/g'
    fi
echo -e "\n----------------------------------------"
fi
