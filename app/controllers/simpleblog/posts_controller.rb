require_dependency "simpleblog/application_controller"

module Simpleblog
  class PostsController < ApplicationController

    # Use the main Rails app's application layout
    layout "application"

    # /post-name
    def show
      @post = Post.find(params[:id])
      @title = @post.title
    end

  end
end
