source "https://rubygems.org"

# Declare your gem's dependencies in simpleblog.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'debugger'
#



group :test do
  gem "shoulda-matchers"
end

group :development, :test do
  gem "rspec-rails", "~> 2.12"
  gem "factory_girl_rails"
end


group :test do
  gem 'database_cleaner'
end

gem 'sass-rails'
gem 'less-rails'




