// ④コントローラーのcreateアクション発火後、このファイルが読み込まれ、発火する

import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // contentはコントローラーのcreateアクション内で指定したcontentから来ている
    // {content: {created_at: "2020-07-29T08:46:24.978Z" id: 1 text: "あああ" updated_at: "2020-07-29T08:46:24.978Z"}}
    const html = `<p>${data.content.text}</p>`;
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('message_text');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  }
});
