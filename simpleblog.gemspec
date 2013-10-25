$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simpleblog/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simpleblog"
  s.version     = Simpleblog::VERSION
  s.authors     = ["Nando Sousa"]
  s.email       = ["nandosousafr@gmail.com"]
  s.homepage    = "http://pixelbits.com.br"
  s.summary     = "Simple blog engine for rails 4 applications"
  s.description = "Simple blog engine for rails 4 applications"

  s.files = Dir["{app,config,db,lib,vendor}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]


  s.add_dependency "rails", ">= 4.0.0"
  s.add_dependency "redactor-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_dependency 'paperclip',       '>= 3.0.0'
  s.add_dependency 'carrierwave',     '>= 0.9.0'
  s.add_dependency 'mini_magick',     '>= 3.6.0'
  s.add_dependency 'jquery-rails',    '>= 3.0.0'
  s.add_dependency 'jquery-ui-rails', '>= 4.0.0'
end
