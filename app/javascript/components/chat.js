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
              messages.insertAdjacentHTML('beforeend', data["message_html"]);
              messages.scrollTop = messages.scrollHeight;
            } else {
              const newLink = `users/${data.sender_id}/messages/new`
              const notification = document.getElementById('notifications');
              const linkTo = notification.querySelector("a");
              linkTo.href = newLink;
              notification.classList.add("active", "animated", "tada");
              // window.alert("You have a new conversation!")
            }
            // 1b. if this conversation page is with an other user:
            //   send a notif
          } else {
            // window.alert("You have a new message!")
              const newLink = `users/${data.sender_id}/messages/new`
              const notification = document.getElementById('notifications');
              const linkTo = notification.querySelector("a");
              linkTo.href = newLink;
              notification.classList.add("active", "animated", "tada");
          }
          // 2. if we are on any other page, else:
          // display a notif window.alert
        },
      }
    )
  })
}

export { initChat };
