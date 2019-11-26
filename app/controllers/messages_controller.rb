class MessagesController < ApplicationController
  def new
    @message = Message.new
    @user = User.find(params[:user_id])
  end

  def create
    @message = Message.new(message_params)
    @message.sender = current_user
    @message.recipient = User.find(params[:receiver_id])
    raise
      if @message.save!
        flash[:success] = "message sent!"
        redirect_to root_url
      else
        render 'new'
      end
  end

  private

  def message_params
    params.require(:message).permit(:text)
  end
end
