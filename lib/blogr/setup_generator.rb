require "rails/generators"
module Blogr
  class SetupGenerator < Rails::Generators::Base
    
    def create_route
      route 'mount Blogr::Engine => "/blogr"'
    end

  end
end