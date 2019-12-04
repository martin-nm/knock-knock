require 'date'

class PostsController < ApplicationController

  def index
    @excludeds = Excluded.where(user_id: current_user)
    @excluded_posts = []

    @excludeds.each do |excluded|
      @excluded_posts << excluded.post
    end

    @expired_posts = []
    @all_posts = Post.all.order(created_at: :desc).to_ary

    @all_posts.each do |post|
      @expired_posts << post if post.expires_at < Time.zone.now
    end

    @posts = Post.all.order(created_at: :desc).to_ary - @excluded_posts - @expired_posts
    @community_posts = Post.where(category: 'Community').order(created_at: :desc).to_ary - @excluded_posts - @expired_posts
    @utility_posts = Post.where(category: 'Utility').order(created_at: :desc).to_ary - @excluded_posts - @expired_posts
    @expertise_posts = Post.where(category: 'Expertise').order(created_at: :desc).to_ary - @excluded_posts - @expired_posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      @post.expires_at = @post.created_at + 86400
      @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
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

