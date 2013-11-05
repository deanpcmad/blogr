require_dependency "blogr/application_controller"

module Blogr
	class TagsController < ApplicationController
	
		before_action :set_tag, only: [:show, :edit, :update, :destroy]

		def index
			@tags = Tag.all
			@title = "Tags"
		end

		def show
			@title = @tag.name
		end

		def new
			@tag = Tag.new
			@title = "New Tag"
		end

		def edit
			@title = "Editing '#{@tag.name}'"
		end

		def create
			@tag = Tag.new(tag_params)

			if @tag.save
				redirect_to tags_path, notice: 'Tag was successfully created.'
			else
				render action: 'new'
			end
		end

		def update
			if @tag.update(tag_params)
				redirect_to tags_path, notice: 'Tag was successfully updated.'
			else
				render action: 'edit'
			end
		end

		def destroy
			@tag.destroy
			redirect_to categories_url, notice: 'Tag was successfully destroyed.'
		end

		private
			# Use callbacks to share common setup or constraints between actions.
			def set_tag
				@tag = Tag.find_by(permalink: params[:id])
			end

			def tag_params
				params.require(:tag).permit(:name, :permalink)
			end

	end
end
