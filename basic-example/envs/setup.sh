#!/bin/bash

JUPYTER_SETTINGS=/opt/conda/share/jupyter/lab/settings
DEVNOTE_PATH=/home/jovyan/work/devnotes/template

echo "Setting up environment"
/home/jovyan/.local/bin/uv pip install --upgrade nucleus-cdk
rsync -av /home/jovyan/work-preload/ /home/jovyan/work
cat /opt/nucleus-envs/jupyter_server_config_additional.py >> /home/jovyan/.jupyter/jupyter_server_config.py

mkdir -p ${JUPYTER_SETTINGS}
cp /opt/nucleus-envs/overrides.json ${JUPYTER_SETTINGS}/overrides.json

# Bring down the curvenote template
if [ -d ${DEVNOTE_PATH} ]; then 
    cd ${DEVNOTE_PATH}
    git pull --ff-only 
else
    git clone https://github.com/antonrmolina/devnote-template.git ${DEVNOTE_PATH}
fi