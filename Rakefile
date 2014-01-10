require 'rubygems'
require 'rake'
require 'rdoc'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), *%w[lib]))

# Returns the name of the project
def name
  @name ||= Dir['*.gemspec'].first.split('.').first
end

# Returns the version number of the project
def version
  line = File.read("lib/#{name}/version.rb")[/^\s*VERSION\s*=\s*.*/]
  line.match(/.*VERSION\s*=\s*['"](.*)['"]/)[1]
end

if ENV["TRAVIS"] == "true"
  require 'coveralls/rake/task'
  Coveralls::RakeTask.new

  task :default => [:test, :features, 'coveralls:push']
else
  task :default => [:test, :features]
end

# << test
require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

# << rdoc
require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "#{name} #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

# << features
begin
  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new(:features) do |t|
    t.profile = "travis"
  end
  Cucumber::Rake::Task.new(:"features:html", "Run Cucumber features and produce HTML output") do |t|
    t.profile = "html_report"
  end
rescue LoadError
  desc 'Cucumber rake task not available'
  task :features do
    abort 'Cucumber rake task is not available. Be sure to install cucumber as a gem or plugin'
  end
end
