$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "blogr/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|

  s.name        = "blogr"
  s.version     = Blogr::VERSION
  s.authors     = ["Dean Perry"]
  s.email       = ["dean@voupe.com"]
  s.homepage    = "http://blogrhq.com"
  s.summary     = "Rails blogging platform"
  s.description = "A Rails engine for adding blogging to any Rails 4 application"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", ">= 4.0.0"
  s.add_dependency "carrierwave",     ">= 0.9.0"
  s.add_dependency "mini_magick",     ">= 3.6.0"
  s.add_dependency "jquery-rails",    ">= 3.0.0"
  s.add_dependency "jquery-ui-rails", ">= 4.1.0"
  s.add_dependency "haml",            ">= 4.0.4"
  s.add_dependency "redcarpet",       ">= 3.0.0"
  s.add_dependency "pygments.rb",     ">= 0.5.0"
  s.add_dependency "active_link_to",  ">= 1.0.1"
  s.add_dependency "batch-rails-4",   ">= 0.2.2"
  s.add_dependency "bcrypt-ruby",     ">= 3.1.2"
  s.add_dependency "xml-simple",      ">= 1.1.3"
  s.add_dependency "reverse_markdown",">= 0.4.7"
  s.add_dependency "jbuilder",">= 1.2"

  s.add_development_dependency "mysql2"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "yard"
  s.add_development_dependency "yard-activerecord"
  s.add_development_dependency "haml-rails"

end
