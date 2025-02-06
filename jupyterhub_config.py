import os

c = get_config()

# Use DockerSpawner
c.JupyterHub.spawner_class = "dockerspawner.DockerSpawner"

# Container image set via environment variable DOCKER_NOTEBOOK_IMAGE
c.DockerSpawner.image = os.environ["DOCKER_NOTEBOOK_IMAGE"]

# Docker network
network_name = os.environ["DOCKER_NETWORK_NAME"]
c.DockerSpawner.use_internal_ip = True
c.DockerSpawner.network_name = network_name

# Notebook dir
notebook_dir = os.environ.get("DOCKER_NOTEBOOK_DIR", "/home/jovyan/work")
c.DockerSpawner.notebook_dir = notebook_dir

# Volume per user
c.DockerSpawner.volumes = {f"jupyterhub-user-{{username}}": notebook_dir}

# Remove containers when stopped
c.DockerSpawner.remove = True
c.DockerSpawner.debug = True

# Hub connection settings
c.JupyterHub.hub_ip = "jupyterhub"
c.JupyterHub.hub_port = 8080

# Persist data
c.JupyterHub.cookie_secret_file = "/data/jupyterhub_cookie_secret"
c.JupyterHub.db_url = "sqlite:////data/jupyterhub.sqlite"

# Allow all signups
c.Authenticator.allow_all = True
c.JupyterHub.authenticator_class = "nativeauthenticator.NativeAuthenticator"
c.NativeAuthenticator.open_signup = True

# Admin
admin = os.environ.get("JUPYTERHUB_ADMIN")
if admin:
    c.Authenticator.admin_users = [admin]