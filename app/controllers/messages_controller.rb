class MessagesController < ApplicationController
  def new
    @message = Message.new
    @user = User.find(params[:user_id])
    user_id = params[:user_id]
    @messages = Message.where('(sender_id  = ? AND recipient_id = ?) OR (sender_id  = ? AND recipient_id = ?)', current_user.id, user_id, user_id, current_user.id)
    @messages = @messages.order("created_at ASC").all
    array = []
    @messages2 = Message.where('(sender_id  = ? OR recipient_id = ?)', current_user.id, current_user.id)
    @messages2.each do |m|
      if m.sender_id == current_user.id
        array << m.recipient_id
      else
        array << m.sender_id
      end
    end
    @chats = []
    array.uniq.each do |id|
      user = User.find(id)
      @chats << { id: id, name: user.first_name }
    end
  end

  def create
    @message = Message.new(message_params)
    @message.sender = current_user
    @message.recipient = User.find(params[:user_id])
    if @message.save
      respond_to do |format|
        format.js
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:text)
  end
end
