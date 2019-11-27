class MessagesController < ApplicationController
  def new
    @message = Message.new
    @user = User.find(params[:user_id])
  end

  def create
    @message = Message.new(message_params)
    @message.sender = current_user
    @message.recipient = User.find(params[:user_id])
      if @message.save!
        flash[:success] = "message sent!"
        redirect_to new_user_message_path
      else
        redirect_to new_user_message_path
      end
  end

  private

  def message_params
    params.require(:message).permit(:text)
  end
end
