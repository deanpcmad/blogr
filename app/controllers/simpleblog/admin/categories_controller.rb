require_dependency "simpleblog/admin/admin_controller"

module Simpleblog
  class Admin::CategoriesController < AdminController
    before_action :set_category, only: [:show, :edit, :update, :destroy]

    # GET /categories
    def index
      @categories = Category.all
    end

    # GET /categories/1
    def show
    end

    # GET /categories/new
    def new
      @category = Category.new
    end

    # GET /categories/1/edit
    def edit
    end

    # POST /categories
    def create
      @category = Category.new(category_params)

      if @category.save
        redirect_to admin_category_path(@category), notice: 'Category was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /categories/1
    def update
      if @category.update(category_params)
        redirect_to admin_category_path(@category), notice: 'Category was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /categories/1
    def destroy
      @category.destroy
      redirect_to admin_categories_url, notice: 'Category was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_category
        @category = Category.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def category_params
        params.require(:category).permit(:title, :description)
      end
  end
end
