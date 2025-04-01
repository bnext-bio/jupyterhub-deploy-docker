
# Additional configuration for the nucleus jupyter environment

c.JupyterLabTemplates.allowed_extensions = ["*.ipynb"]
c.JupyterLabTemplates.template_dirs = ["/home/jovyan/work/.templates"]
c.JupyterLabTemplates.include_default = False
c.JupyterLabTemplates.include_core_paths = True
c.JupyterLabTemplates.template_label = "Template"

c.ContentsManager.allow_hidden = True

c.ServerProxy.servers = {
    "curvenote-start": {
        "command": ["/bin/bash", "/opt/nucleus-envs/curvenote-launch.sh", "{port}"],
        "absolute_url": False,
        "environment": {
            "BASE_URL": "{base_url}/proxy/{port}"
        }
        "launcher_entry": {
            "enabled": True,
            "title": "Curvenote Preview"
        }
    }
}