#!/bin/bash

JUPYTER_SETTINGS=/opt/conda/share/jupyter/lab/settings
DEVNOTE_PATH=/home/jovyan/work/devnotes/template

echo "Setting up environment"
pip install --upgrade nucleus-cdk

cat /opt/nucleus-envs/jupyter_server_config_additional.py >> /home/jovyan/.jupyter/jupyter_server_config.py

mkdir -p ${JUPYTER_SETTINGS}
cp /opt/nucleus-envs/overrides.json ${JUPYTER_SETTINGS}/overrides.json

# Bring down and update our baseline work directory
if [ -d /home/jovyan/repo ]; then
    rm -rf /home/jovyan/repo;
fi

git clone --depth=1 https://github.com/bnext-bio/jupyterhub-deploy-docker.git /home/jovyan/repo
rsync -av /home/jovyan/repo/basic-example/work-preload/ /home/jovyan/work

# Bring down the curvenote template
if [ -d ${DEVNOTE_PATH} ]; then 
    cd ${DEVNOTE_PATH}
    git pull --ff-only 
else
    git clone --depth=1 https://github.com/antonrmolina/devnote-template.git ${DEVNOTE_PATH}
fi

# Create LSP symlink
ln -s / /home/jovyan/work/.lsp_symlink