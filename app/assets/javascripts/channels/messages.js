$(document).ready(function() {
  App.messages = App.cable.subscriptions.create(
  {
    channel: "MessagesChannel",
    conversation_id: $("#chat_room").attr("current-conversation-id"),
  },
  {
    received: function(data) {
      $("#messages-list").append(this.renderMessage(data));

      // Scroll bottom when a new message appended
      var messages_scrollbar = $("#messages_scrollbar");
      var height = messages_scrollbar[0].scrollHeight;
      messages_scrollbar.scrollTop(height);

      // Clear field after submit
      $("#message_field").val("");
    },

    renderMessage: function(data) {
      var currrent_user_id = $("#chat_room").attr("current-user-id");
      if (currrent_user_id == data.sender_id) {
        return data.message_for_sender;
      }
      return data.message_for_recipient;
    }
  });
})
