#!/usr/bin/env bash

resolution=$(identify $1 | awk '{print $3}')
IFS='x' # x is set as delimiter
read -ra ADDR <<< "$resolution"
width=${ADDR[0]}
height=${ADDR[1]}

### Display Image / offset with mutt bar
echo -e "2;3;\n0;1;0;42;$((width));$((height));0;0;0;0;$1\n4;\n3;" | /usr/lib/w3m/w3mimgdisplay &
