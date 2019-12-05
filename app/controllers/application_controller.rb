class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_messages_path
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_messages_path
    @message_path = "#"
    if current_user && Message.where(recipient: current_user).count >= 1
      @message_path = new_user_message_path(Message.where(recipient: current_user).last.sender)
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :job, :bio, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :job, :bio, :photo])
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
