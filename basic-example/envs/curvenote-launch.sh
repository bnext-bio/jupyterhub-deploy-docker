#!/bin/bash

CURVENOTE_BUILD=/opt/nucleus-envs/curvenote-build.sh

caddy file-server --listen :$1 --browse -r ~/work/devnotes/.html &
nodemon -w ~/work/devnotes/ -i _build/ -i .html/ --ext md,yml,json,ipynb,html -x $CURVENOTE_BUILD &