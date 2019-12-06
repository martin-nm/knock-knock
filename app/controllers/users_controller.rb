class UsersController < ApplicationController
  def index
    if params[:range].present?
      @users = User.where.not(id: current_user.id).near([params[:latitude], params[:longitude]], params[:range])
    else
      @users = User.where.not(id: current_user.id).geocoded
    end
    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: user }),
        image_url: helpers.asset_url('pin-map.svg'),
        id: user.id
      }
    end
    if params[:onlyUsers]
      render json: {
        html: render_to_string(partial: "users/map_and_list")
      }
    else
      render "users/index"
    end

  end

  def show
    @user = User.find(params[:id])
  end
end
