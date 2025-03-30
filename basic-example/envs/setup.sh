#!/bin/bash

echo "Setting up environment"
/home/jovyan/.local/bin/uv pip install --upgrade nucleus-cdk
rsync -av /home/jovyan/work-preload/ /home/jovyan/work
cat /opt/nucleus-envs/jupyter_server_config_additional.py >> /home/jovyan/.jupyter/jupyter_server_config.py

# Bring down the curvenote template
if [ -d ~/work/templates/devnote ]; then 
    cd ~/work/templates/devnote
    git pull --ff-only 
else
    git clone https://github.com/antonrmolina/devnote-template.git /home/jovyan/work/templates/devnote
fi