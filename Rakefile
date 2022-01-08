# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'glimmer/launcher'
require 'rake'
require 'juwelier'
Juwelier::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "glimmer-cp-messageboxpanel"
  gem.homepage = "http://github.com/AndyObtiva/glimmer-cp-messageboxpanel"
  gem.license = "MIT"
  gem.summary = %Q{Message Box Panel - Glimmer Custom Shape}
  gem.description = %Q{Message Box Panel - Glimmer DSL for SWT Custom Shape - message_box_panel is a graphical alternative to the native SWT message_box}
  gem.email = "andy.am@gmail.com"
  gem.authors = ["Andy Maleh"]

  gem.files = Dir['glimmer-cp-messageboxpanel.gemspec', 'CHANGELOG.md', 'README.md', 'VERSION', 'LICENSE.txt', 'lib/**/*', 'samples/**/*']
  # dependencies defined in Gemfile
end
Juwelier::RubygemsDotOrgTasks.new
require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
  spec.ruby_opts = [Glimmer::Launcher.jruby_os_specific_options]
end

desc "Code coverage detail"
task :simplecov do
  ENV['COVERAGE'] = "true"
  Rake::Task['spec'].execute
end

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "glimmer-cp-messageboxpanel #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'glimmer/rake_task'
