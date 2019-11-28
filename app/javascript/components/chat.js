import { createConsumer } from "@rails/actioncable"

const initChat = () => {
  window.addEventListener("DOMContentLoaded", () => {
    const consumer = createConsumer();
    const userId = document.querySelector("#user-id").value;
    consumer.subscriptions.create(
      { channel: "ChatChannel", user_id: userId },
      {
        received(data) {
          // if we are on the right message page:
          // append the message html :
          const messages = document.querySelector('.main-container');
          messages.insertAdjacentHTML('afterbegin', data["message_html"]);
          // if we are on any other page, else:
          // display a notif window.alert
        },
      }
    )
  })
}

export { initChat };
