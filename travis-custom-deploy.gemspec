$:.push File.expand_path("../lib", __FILE__)
require "travis-custom-deploy/version"

Gem::Specification.new do |s|
  s.name        = "travis-custom-deploy"
  s.version     = TravisCustomDeploy::VERSION
  s.platform    = Gem::Platform::RUBY
  s.licenses    = ['MIT']
  s.authors     = ["Jens Nazarenus"]
  s.email       = ["me@jens-na.de"]
  s.homepage    = "https://github.com/jens-na/travis-custom-deploy"
  s.summary     = %q{Travis custom deployment gem}
  s.description = %q{Deploy your ruby based applications to your own servers}
  
  s.add_runtime_dependency('net-sftp', "~> 2.1.2")
  
  s.add_development_dependency("rspec", "~>2.14.1")
  s.add_development_dependency('rake', "~> 10.1.1")
  s.add_development_dependency('redgreen', "~> 1.2.2")
  s.add_development_dependency('shoulda-context', "~> 1.1.6") 
  s.add_development_dependency('rr', "~> 1.1.2")
  s.add_development_dependency('coveralls', "~> 0.7.0")
  s.add_development_dependency('pry')
  s.add_development_dependency('pry-nav')

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
