class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat:received_messages_#{params[:user_id]}"
  end
end
