#!/bin/bash

echo ""
echo "        ╦ ╦┌─┐┌─┐┬─┐╔═╗┌┐┌┬ ┬┌┬┐"
echo "        ║ ║└─┐├┤ ├┬┘║╣ ││││ ││││"
echo "        ╚═╝└─┘└─┘┴└─╚═╝┘└┘└─┘┴ ┴"
echo "      Escrito por Juampa Rodríguez      "
echo "----------------------------------------"
echo ""

curl -s "https://"$1"/activity" | grep -n "<name>" | cut -d ">" -f3-8 | sort | uniq | sed 's/<name>/ Nombre: /g' | sed 's/<\/name><email>/\n Email: /g' | sed 's/<\/email><uri>https:\/\/'$1'\/secure\/ViewProfile.jspa?name=/\n Username: /g' | sed 's/<\/uri/\n/'

echo "----------------------------------------"
