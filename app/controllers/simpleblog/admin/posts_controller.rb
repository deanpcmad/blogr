require_dependency "simpleblog/application_controller"

module Simpleblog
  class Admin::PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    # GET /posts
    def index
      @posts = Post.order id: :desc
    end

    # GET /posts/1
    def show
    end

    # GET /posts/new
    def new
      @post = Post.new
    end

    # GET /posts/1/edit
    def edit
      if params[:delete_image]
        Image.find(params[:delete_image]).try :destroy
      end
    end

    # POST /posts
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

    # PATCH/PUT /posts/1
    def update

      image_upload
      if @post.update(post_params)
        params[:post][:categories] ||= []
        params[:post][:categories].reject! {|c| c.to_s.blank? }




        @post.categories.delete_all
        params[:post][:categories].each do |category_id|
          @post.categories << Category.find(category_id)
        end
        redirect_to @post, notice: 'Post was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /posts/1
    def destroy
      @post.destroy
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, :content, :status, :categories, :published_at, :excerpt)
    end


    def image_params
      params.require(:image).permit!
    end


    def image_upload
      Image.create image_params.merge(post_id: @post.id) if params[:image]
    end


  end
end
