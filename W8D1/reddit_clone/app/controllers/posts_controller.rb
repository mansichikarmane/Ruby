class PostsController < ApplicationController
  before_action :require_signed_in!, only: [:new, :create, :destroy, :edit, :update]
  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to post_url(@post.id)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    render :show
  end

  def edit
    @post = Post.find_by(id: params[:id])
    @post.author_id = params[:author_id] 
    render :edit
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.author_id = params[:author_id] 
    if @post.update(post_params)
      redirect_to post_url(@post.author_id)
    else
      render :edit
      flash[:errors] = @post.errors.full_messages
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post 
      @post.destroy
      redirect_to posts_url
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, :author_id, :sub_id)
  end
end
