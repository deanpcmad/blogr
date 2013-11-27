module Blogr
  class Engine < ::Rails::Engine
    
    require "batch-rails-4"

    isolate_namespace Blogr

    config.generators do |g|
    	g.orm             :active_record
      g.test_framework      :rspec, fixture: false, view_specs: false
      g.fixture_replacement :factory_girl, dir: "spec/factories"
      g.stylesheets     false
      g.javascripts     false
      g.helper          false
    end

  end
end