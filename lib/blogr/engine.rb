module Blogr
  class Engine < ::Rails::Engine
    
    require "batch-rails-4"

    isolate_namespace Blogr

  end
end