$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simpleblog/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simpleblog"
  s.version     = Simpleblog::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Simpleblog."
  s.description = "TODO: Description of Simpleblog."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "pg"
  s.add_dependency 'twitter-bootstrap-rails', '~> 2.2.7'
end
