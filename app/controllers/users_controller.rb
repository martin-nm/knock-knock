class UsersController < ApplicationController
  def index

    # Si params présent
      # @user filtré avec .near
    # else
    @users = User.geocoded
    # end
    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: user }),
        image_url: helpers.asset_url('pin-map.svg'),
        id: user.id
      }
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
