require_dependency "blogr/application_controller"

module Blogr
  class PostsController < ApplicationController

    # Use the main Rails app's application layout
    layout "application"

    # /post-name
    def show
      @post = Post.find_by_permalink!(params[:id])
      @title = @post.title
      @page_title = @post.title
      @subtitle = @post.title
    end

  end
end
