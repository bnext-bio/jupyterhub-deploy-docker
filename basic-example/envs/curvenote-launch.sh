#!/bin/bash

CURVENOTE_BUILD=/opt/nucleus-envs/curvenote-build.sh

if [ ! -f ./curvenote.yml ]; then
    echo Not in a curvenote directory
    exit 1
fi

caddy file-server --listen :$1 -r ./_build/html &
nodemon -w . -i _build/ -x $CURVENOTE_BUILD &