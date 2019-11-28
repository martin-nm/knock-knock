class ExcludedsController < ApplicationController

  def create
    @excluded = Excluded.new
    @excluded.user = current_user
    @excluded.post = Post.find(params[:post_id])
    if @excluded.save
      redirect_to posts_path
    else
      render :new
    end
  end
end
