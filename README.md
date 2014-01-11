travis-custom-deploy [![Gem Version](https://badge.fury.io/rb/travis-custom-deploy.png)](http://badge.fury.io/rb/travis-custom-deploy) 
====================
 [![Build Status](https://travis-ci.org/jens-na/travis-custom-deploy.png?branch=master)](https://travis-ci.org/jens-na/travis-custom-deploy) 
 [![Coverage Status](https://coveralls.io/repos/jens-na/travis-custom-deploy/badge.png?branch=master)](https://coveralls.io/r/jens-na/travis-custom-deploy?branch=master)
 [![Code Climate](https://codeclimate.com/github/jens-na/travis-custom-deploy.png)](https://codeclimate.com/github/jens-na/travis-custom-deploy)
 [![Dependency Status](https://gemnasium.com/jens-na/travis-custom-deploy.png)](https://gemnasium.com/jens-na/travis-custom-deploy)

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

#### Services
There are predefined services available. For example if you want to deploy a [Jekyll](https://github.com/jekyll/jekyll) page you can write:

```yml
after_success: travis-custom-deploy sftp service:jekyll
```

Services currently availble:
```
Service  File
-------- -------
jekyll   _site/
```

License and Copyright
=====================
Licensed under the MIT license. 

Jens Nazarenus, 2014
