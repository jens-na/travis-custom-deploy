travis-custom-deploy [![Gem Version](https://badge.fury.io/rb/travis-custom-deploy.png)](http://badge.fury.io/rb/travis-custom-deploy)  [![Build Status](https://travis-ci.org/jens-na/travis-custom-deploy.png?branch=master)](https://travis-ci.org/jens-na/travis-custom-deploy)
====================




Deploy your ruby based applications on your own server.

Configuration
-------------
You need to define environment variables with Travis. `travis-custom-deploy` will use those to 
deploy your application.

Example:
```yml
env:
  global:
    - "CUSTOM_DEPLOY_HOST=host"
    - "CUSTOM_DEPLOY_USER=user"
    - "CUSTOM_DEPLOY_PASSWORD=password"
    - "CUSTOM_DEPLOY_REMOTEDIR=/path/to/"

after_success: travis-custom-deploy sftp _site/
```
License and Copyright
=====================
Licensed under the MIT license. 

Jens Nazarenus, 2014
