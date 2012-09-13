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
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name        = 'jazz'
  gem.authors     = ['Alistair A. Israel']
  gem.email       = ['aisrael@gmail.com']
  gem.homepage    = 'https://github.com/AlistairIsrael/jazz'
  gem.summary     = 'Jazz provides a set of useful UI helpers and other improvisations for use with Railgem.'
  gem.description = 'Basically, I just got tired of copy pasting files from one project to another so decided to get my feet wet writing a Rails plugin/engine gem. '

  gem.files             = `git ls-files`.split("\n")
  gem.test_files        = `git ls-files -- {test,spec}/*`.split("\n")
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

require 'rspec/core/rake_task'
desc 'Run RSpec tests'
RSpec::Core::RakeTask.new(:spec) do |test|
  test.verbose = true
end

# TODO Use simplecov
# require 'rcov/rcovtask'
# Rcov::RcovTask.new do |test|
  # test.libs << 'test'
  # test.pattern = 'test/**/test_*.rb'
  # test.verbose = true
  # test.rcov_opts << '--exclude "gems/*"'
# end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "jazz #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
