require_dependency "blogr/application_controller"

module Blogr
  class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def index
      @posts = Post.order id: :desc
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
      @post = Post.new(post_params)

      if @post.save
        image_upload
        params[:post][:categories] ||= []
        params[:post][:categories].reject! {|c| c.to_s.blank? }

        params[:post][:categories].each do |category_id|
          @post.categories << Category.find(category_id)
        end

        redirect_to @post, notice: 'Post was successfully created.'
      else
        render action: 'new'
      end
    end

    def update

      image_upload
      if @post.update(post_params)
        # params[:post][:categories] ||= []
        # params[:post][:categories].reject! {|c| c.to_s.blank? }

        # @post.categories.delete_all
        # params[:post][:categories].each do |category_id|
        #   @post.categories << Category.find(category_id)
        # end
        redirect_to @post, notice: 'Post was successfully updated.'
      else
        render action: 'edit'
      end
    end

    def destroy
      @post.destroy
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find_by_permalink!(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, :category_id, :permalink, :content, :published, :published_at)
    end

    def image_params
      params.require(:image).permit!
    end

    def image_upload
      Image.create image_params.merge(post_id: @post.id) if params[:image]
    end

  end
end