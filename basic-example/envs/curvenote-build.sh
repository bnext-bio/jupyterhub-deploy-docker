#!/bin/bash

for devnote_dir in `ls -1d ~/work/devnotes/*/`; do
    name=`basename $devnote_dir`
    if [ ! -L ~/work/devnotes/.html/$name ]; then
        ln -s $devnote_dir/_build/html ~/work/devnotes/.html/$name
    fi
    
    cd $devnote_dir

    export BASE_URL=${BASE_URL_PREFIX}/$name/

    curvenote build --html
done

# Kill webserver
ps aux | grep "node ./server.js"| grep -v "grep" | awk '{print $2}' | xargs -r kill