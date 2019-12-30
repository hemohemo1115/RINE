import consumer from "./consumer"

// $(function() {}; で囲むことでレンダリング後に実行される
// レンダリング前に実行されると $('#messages').data('room_id') が取得できない
$(function() {
  const chatChannel = consumer.subscriptions.create({ channel: 'RoomChannel', room: $('#messages').data('room_id') }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received: function(data) {
      // Called when there's incoming data on the websocket for this channel
      this.perform('received', {data});
      return $('#messages').append(data['message']);
    },

    // これが実行されるとコンシューマになったRoomChannel#speak({ message: message })が呼ばれる
    speak: function(message) {
      const current_user = $('.current_user').val();
      const current_user_id = $('.current_user_id').val();
      const current_user_name = $('.current_user_name').val();
      return this.perform('speak', {
        message: message,
        current_user: current_user,
        current_user_id: current_user_id,
        current_user_name: current_user_name
      });
    }
  });

  $(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
    if (event.keyCode === 13) {
      chatChannel.speak(event.target.value);
      event.target.value = '';
      return event.preventDefault();
    }
  });
});