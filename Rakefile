require 'rake'
require 'rspec/core/rake_task'
require 'rdoc/task'

desc 'Default: run specs.'
task :default => :spec

RSpec::Core::RakeTask.new(:spec)
task :default => :spec

desc 'Generate documentation for the piwik_analytics plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'PiwikAnalytics'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
