$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require 'jazz'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'jazz'
  s.version     = Jazz::VERSION
  s.authors     = ['Alistair A. Israel']
  s.email       = ['aisrael@gmail.com']
  s.homepage    = 'https://github.com/AlistairIsrael/jazz'
  s.summary     = 'Jazz provides a set of useful UI helpers and other improvisations for use with Rails.'
  s.description = 'Basically, I just got tired of copy pasting files from one project to another so decided to get my feet wet writing a Rails plugin/engine gem. '

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', '~> 3.2'

  s.add_development_dependency "sqlite3"
end
