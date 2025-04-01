#!/bin/bash

for devnote_dir in `ls -1d ~/work/devnotes/*/`; do
    name=`basename $devnote_dir`
    if [ ! -l ~/work/devnotes/.html/$name ]; then
        if [ -d ~/devnote_dir/_build/html ]; then
            ln -s $devnote_dir/_build/html ~/work/devnotes/.html/$name
        fi
    fi
    
    cd $devnote_dir

    export BASE_URL=${BASE_URL_PREFIX}/$name/

    curvenote build --html
done

# Kill webserver
ps aux | grep "node ./server.js"| grep -v "grep" | awk '{print $2}' | xargs -r kill