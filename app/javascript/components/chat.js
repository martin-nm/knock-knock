import { createConsumer } from "@rails/actioncable"

const initChat = () => {
  window.addEventListener("DOMContentLoaded", () => {
    const consumer = createConsumer();
    const userId = document.querySelector("#user-id").value;
    consumer.subscriptions.create(
      { channel: "ChatChannel", user_id: userId },
      {
        received(data) {
          // 1. if we are on a conversation page:


          if (document.querySelector(".messages-container")) {
            // 1a. if this conversation page is with the right other user
            // if the received message's sender_id is the same as the current conversation's page user id
            const currentConversationRecipientId = parseInt(document.querySelector("#recipient-id").value, 10);
            console.log(currentConversationRecipientId)
            console.log(data)
            if (data["message"]["sender_id"] == currentConversationRecipientId) {
              const messages = document.querySelector('.messages-container');
              messages.insertAdjacentHTML('afterbegin', data["message_html"]);
            }

            // 1b. if this conversation page is with an other user:
            //   send a notif
          }


          // 2. if we are on any other page, else:
          // display a notif window.alert
        },
      }
    )
  })
}

export { initChat };
