class Message < ApplicationRecord
  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'

  after_create :send_notif

  private

  def send_notif
    ChatChannel.broadcast_to(
      "received_messages_#{recipient_id}",
      message: self,
      message_html: ApplicationController.renderer.render(partial: "messages/message", locals: { message: self, current_user_role: :recipient })
    )
  end
end
