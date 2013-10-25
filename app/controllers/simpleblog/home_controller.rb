module Simpleblog
  class HomeController < ApplicationController

  	# Use the main Rails app's application layout
  	layout "application"

    # Display a list of posts on the home page
    def index
			@posts = Post.published.order("published_at DESC")
    end

  end
end