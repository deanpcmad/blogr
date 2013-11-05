require_dependency "blogr/application_controller"

module Blogr
  class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]

    def index
      @categories = Category.all
      @title = "Categories"
    end

    def show
      @title = @category.title
    end

    def new
      @category = Category.new
      @title = "New Category"
    end

    def edit
      @title = "Editing '#{@category.title}'"
    end

    def create
      @category = Category.new(category_params)

      if @category.save
        redirect_to category_path(@category), notice: 'Category was successfully created.'
      else
        render action: 'new'
      end
    end

    def update
      if @category.update(category_params)
        redirect_to category_path(@category), notice: 'Category was successfully updated.'
      else
        render action: 'edit'
      end
    end

    def destroy
      @category.destroy
      redirect_to categories_url, notice: 'Category was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_category
        @category = Category.find_by(permalink: params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def category_params
        params.require(:category).permit(:title, :description)
      end
  end
end
