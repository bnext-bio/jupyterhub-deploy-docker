#!/bin/bash

echo "Setting up environment"
/home/jovyan/.local/bin/uv pip install --upgrade nucleus-cdk
rsync -av /home/jovyan/work-preload/ /home/jovyan/work