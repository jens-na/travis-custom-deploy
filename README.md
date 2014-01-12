travis-custom-deploy [![Gem Version](https://badge.fury.io/rb/travis-custom-deploy.png)](http://badge.fury.io/rb/travis-custom-deploy) 
====================
 [![Build Status](https://travis-ci.org/jens-na/travis-custom-deploy.png?branch=master)](https://travis-ci.org/jens-na/travis-custom-deploy) 
 [![Coverage Status](https://coveralls.io/repos/jens-na/travis-custom-deploy/badge.png?branch=master)](https://coveralls.io/r/jens-na/travis-custom-deploy?branch=master)
 [![Code Climate](https://codeclimate.com/github/jens-na/travis-custom-deploy.png)](https://codeclimate.com/github/jens-na/travis-custom-deploy)
 [![Dependency Status](https://gemnasium.com/jens-na/travis-custom-deploy.png)](https://gemnasium.com/jens-na/travis-custom-deploy)

Deploy your ruby based applications on your own server.

Configuration
-------------
Add the gem to your Gemfile or gemspec.

```ruby
gem "travis-custom-deploy", "~> 0.0.4"
```
To use travis-custom-deploy with Travis-CI you need to define environment variables. I recommend
to use [secure environment variables](http://about.travis-ci.org/docs/user/build-configuration/#Secure-environment-variables) with Travis-CI

The best way to do that is to use travis gem:
```ruby
gem install travis
cd my_project
travis encrypt DEPLOY_HOST="your-hostname.com" --add
...
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
