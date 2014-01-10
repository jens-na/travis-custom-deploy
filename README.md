travis-custom-deploy
====================

Deploy your ruby based applications on your own server.

env:
  global:
    - "CUSTOM_DEPLOY_HOST=host"
    - "CUSTOM_DEPLOY_USER=user"
    - "CUSTOM_DEPLOY_PASSWORD=password"
    - "CUSTOM_DEPLOY_REMOTEDIR=/path/to/"

travis-custom-deploy sftp site/ 
