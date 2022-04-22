#!/bin/bash

getversion(){
    ver=$(basename $(curl -Ls -o /dev/null -w %{url_effective} https://github.com/$1/releases/latest) | grep -o -E "[0-9].+")
    [ $ver ] && echo $ver || git ls-remote --tags git://github.com/$1 | cut -d/ -f3- | sort -t. -nk1,2 -k3 | awk '/^[^{]*$/{version=$1}END{print version}' | grep -o -E "[0-9].+"
}

echo "$(getversion syncthing/syncthing)"