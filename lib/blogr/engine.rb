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

    initializer "blogr.initialize" do |app|
      # Load migrations
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end      
    end

    generators do
      require "blogr/setup_generator"
    end

  end
end