#!/bin/bash

curvenote build --html

# Kill webserver
ps aux | grep -P "(?<!grep) node ./server.js" | awk '{print $2}' | xargs -r kill