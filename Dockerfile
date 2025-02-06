FROM quay.io/jupyterhub/jupyterhub:latest

RUN python3 -m pip install --no-cache-dir \
    dockerspawner \
    jupyterhub-nativeauthenticator \
    elyra

CMD ["jupyterhub", "-f", "/srv/jupyterhub/jupyterhub_config.py"]
