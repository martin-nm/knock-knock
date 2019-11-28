class ExcludedsController < ApplicationController

  def create
    @excluded = Excluded.new
    @excluded.user = current_user
    @excluded.post = Post.find(params[:post_id])
    @excluded.save
    redirect_to posts_path
  end
end
