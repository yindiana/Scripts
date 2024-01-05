#!/bin/bash

echo "entrez les paths à créer"
echo "par exemple : /opt/test/1 /opt/test/2 /opt/test/3"

read path_to_create
for paths in $path_to_create
do
        mkdir -p "$paths"
done
