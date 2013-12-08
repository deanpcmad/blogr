require_dependency "blogr/application_controller"

module Blogr
	class PostsController < ApplicationController

		before_action :set_post, only: [:show, :edit, :update, :destroy]

		def index
			@posts = Post.order(published_at: :desc)
			@title = "Posts"
		end

		def show
			@title = @post.title
		end

		def new
			@post = Post.new
			@title = "New Post"
		end

		def edit
			if params[:delete_image]
				Image.find(params[:delete_image]).try :destroy
			end
			@title = "Editing '#{@post.title}'"
		end

		def create
			@post = current_blogr_user.posts.build(post_params)
			if @post.save
				redirect_to @post, notice: "Post was successfully created"
			else
				render action: "new"
			end
		end

		def update

			if @post.update(post_params)
				redirect_to @post, notice: "Post was successfully updated"
			else
				render action: "edit"
			end
		end

		def destroy
			@post.destroy
			redirect_to posts_url, notice: "Post was successfully destroyed"
		end

    def preview
      @post = Post.new(post_params)
      render @post
    end


		private

		def set_post
			@post = Post.find_by_permalink!(params[:id])
		end

		def post_params
			params.require(:post).permit(:title, :category_id, :permalink, :content, :tag_list, :published, :published_at)
		end

	end
end