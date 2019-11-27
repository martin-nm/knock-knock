class ExcludedsController < ApplicationController

  def create
    @excluded = Excluded.new(excluded_params)
    @excluded.user = current_user
    if @excluded.save
      redirect_to posts_path
    else
      render :new
    end
  end
end
