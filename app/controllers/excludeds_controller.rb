class ExcludedsController < ApplicationController
  def create
    @excluded = Excluded.new
    @excluded.user = current_user
    @excluded.post = Post.find(params[:post_id])
    @excluded.save
    @post = @excluded.post
    respond_to do |format|
      format.html { redirect_to posts_path }
      format.js # <-- will render `app/views/reviews/create.js.erb`
    end
  end
end
