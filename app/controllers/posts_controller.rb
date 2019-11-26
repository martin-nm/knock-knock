class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    raise
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    @post_params = Post.find(params[:id])
    if @post.destroy
      redirect_to posts_path
    else
      redirect_to post_path(@post)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :category, :content, :user_id)
  end
end

