# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "jazz"
  s.version = "0.4.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alistair A. Israel"]
  s.date = "2013-03-13"
  s.description = "Basically, I just got tired of copy pasting files from one project to another so decided to get my feet wet writing a Rails plugin/engine gem. "
  s.email = ["aisrael@gmail.com"]
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "MIT-LICENSE",
    "README.rdoc",
    "Rakefile",
    "app/assets/javascripts/jazz.js.coffee",
    "app/assets/stylesheets/jazz.css.scss",
    "app/helpers/jazz_helper.rb",
    "jazz.gemspec",
    "lib/jazz.rb",
    "lib/jazz/bootstrap/form_helpers.rb",
    "lib/jazz/bootstrap/helpers.rb",
    "lib/jazz/form_helpers.rb",
    "lib/tasks/jazz_tasks.rake",
    "spec/helpers/jazz_helper_spec.rb",
    "spec/jazz/bootstrap/helpers_spec.rb",
    "spec/jazz/form_helpers_spec.rb",
    "spec/spec_helper.rb",
    "test/dummy/README.rdoc",
    "test/dummy/Rakefile",
    "test/dummy/app/assets/javascripts/application.js",
    "test/dummy/app/assets/stylesheets/application.css",
    "test/dummy/app/controllers/application_controller.rb",
    "test/dummy/app/helpers/application_helper.rb",
    "test/dummy/app/views/layouts/application.html.erb",
    "test/dummy/config.ru",
    "test/dummy/config/application.rb",
    "test/dummy/config/boot.rb",
    "test/dummy/config/database.yml",
    "test/dummy/config/environment.rb",
    "test/dummy/config/environments/development.rb",
    "test/dummy/config/environments/production.rb",
    "test/dummy/config/environments/test.rb",
    "test/dummy/config/initializers/backtrace_silencers.rb",
    "test/dummy/config/initializers/inflections.rb",
    "test/dummy/config/initializers/mime_types.rb",
    "test/dummy/config/initializers/secret_token.rb",
    "test/dummy/config/initializers/session_store.rb",
    "test/dummy/config/initializers/wrap_parameters.rb",
    "test/dummy/config/locales/en.yml",
    "test/dummy/config/routes.rb",
    "test/dummy/public/404.html",
    "test/dummy/public/422.html",
    "test/dummy/public/500.html",
    "test/dummy/public/favicon.ico",
    "test/dummy/script/rails",
    "test/jazz_test.rb",
    "test/test_helper.rb"
  ]
  s.homepage = "https://github.com/AlistairIsrael/jazz"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.25"
  s.summary = "Jazz provides a set of useful UI helpers and other improvisations for use with Railgem."
  s.test_files = ["spec/helpers/jazz_helper_spec.rb", "spec/jazz/bootstrap/helpers_spec.rb", "spec/jazz/form_helpers_spec.rb", "spec/spec_helper.rb", "test/dummy/README.rdoc", "test/dummy/Rakefile", "test/dummy/app/assets/javascripts/application.js", "test/dummy/app/assets/stylesheets/application.css", "test/dummy/app/controllers/application_controller.rb", "test/dummy/app/helpers/application_helper.rb", "test/dummy/app/mailers/.gitignore", "test/dummy/app/models/.gitignore", "test/dummy/app/views/layouts/application.html.erb", "test/dummy/config.ru", "test/dummy/config/application.rb", "test/dummy/config/boot.rb", "test/dummy/config/database.yml", "test/dummy/config/environment.rb", "test/dummy/config/environments/development.rb", "test/dummy/config/environments/production.rb", "test/dummy/config/environments/test.rb", "test/dummy/config/initializers/backtrace_silencers.rb", "test/dummy/config/initializers/inflections.rb", "test/dummy/config/initializers/mime_types.rb", "test/dummy/config/initializers/secret_token.rb", "test/dummy/config/initializers/session_store.rb", "test/dummy/config/initializers/wrap_parameters.rb", "test/dummy/config/locales/en.yml", "test/dummy/config/routes.rb", "test/dummy/db/.gitignore", "test/dummy/lib/assets/.gitignore", "test/dummy/log/.gitignore", "test/dummy/public/404.html", "test/dummy/public/422.html", "test/dummy/public/500.html", "test/dummy/public/favicon.ico", "test/dummy/script/rails", "test/jazz_test.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 3.2"])
      s.add_development_dependency(%q<rspec>, ["~> 2.11"])
      s.add_development_dependency(%q<rspec-rails>, ["~> 2.0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<rails-i18n>, [">= 0"])
      s.add_runtime_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<rails>, ["~> 3.2"])
      s.add_dependency(%q<rspec>, ["~> 2.11"])
      s.add_dependency(%q<rspec-rails>, ["~> 2.0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<rails-i18n>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.2"])
    s.add_dependency(%q<rspec>, ["~> 2.11"])
    s.add_dependency(%q<rspec-rails>, ["~> 2.0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<rails-i18n>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end

