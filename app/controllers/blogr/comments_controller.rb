require_dependency "blogr/application_controller"

module Blogr
  class CommentsController < ApplicationController

  	before_action :set_comment, only: [:show, :edit, :update, :destroy]

  	def index
  		@title = "Comments"
  		@comments = Blogr::Comment.all
  	end

  	def show
			@title = "Comment ##{@comment.id}"
		end

		def new
			@comment = Comment.new
			@title = "New Comment"
		end

		def edit
			@title = "Editing Comment by '#{@comment.author_name}'"
		end

		def create
			@comment = Comment.new(tag_params)

			if @comment.save
				redirect_to @comment, notice: 'Comment was successfully created.'
			else
				render action: 'new'
			end
		end

		def update
			if @comment.update(tag_params)
				redirect_to @comment, notice: 'Comment was successfully updated.'
			else
				render action: 'edit'
			end
		end

		def destroy
			@comment.destroy
			redirect_to comments_path, notice: 'Comment was successfully destroyed.'
		end

		private
			# Use callbacks to share common setup or constraints between actions.
			def set_comment
				@comment = Comment.find(params[:id])
			end

			def comment_params
				params.require(:comment).permit(:content, :author_name, :author_email)
			end

  end
end