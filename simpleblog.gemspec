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

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]


  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "redactor-rails"

  s.add_development_dependency "pg"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_dependency 'paperclip'
  s.add_dependency 'less-rails'
  s.add_dependency 'carrierwave'
  s.add_dependency 'mini_magick'
  s.add_dependency 'twitter-bootstrap-rails', '~> 2.2.7'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'sass-rails'
end
