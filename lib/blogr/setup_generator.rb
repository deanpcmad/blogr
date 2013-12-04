require "rails/generators"
module Blogr
  class SetupGenerator < Rails::Generators::Base

		source_root File.expand_path("../../../config/", __FILE__)
    
    # Adds blogr route to routes.rb
    def create_route
      route 'mount Blogr::Engine => "/blogr"'
    end

    # Copies the default blogr config file to config/blogr.rb
    def copy_initializer_file
      copy_file "blogr.example.rb", "config/blogr.rb"
    end

    # Creates config/initializers/blogr.rb config file loader
    def create_initializer_file
      create_file "config/initializers/blogr.rb", "Blogr::Configuration.load(Rails.root.join('config', 'blogr.rb'))"
    end

  end
end