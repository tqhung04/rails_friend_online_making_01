$(document).ready(function() {
  remove_all_streams();
  var currrent_user_id = $('#chat_room').attr('current-user-id');
  App.messages = App.cable.subscriptions.create(
  {
    channel: 'MessagesChannel',
    conversation_id: $('#chat_room').attr('current-conversation-id'),
  },
  {
    received: function(data) {
      $('#messages-list').append(this.renderMessage(data));

      // Scroll bottom when a new message appended
      var messages_scrollbar = $('#messages_scrollbar');
      var height = messages_scrollbar[0].scrollHeight;
      messages_scrollbar.scrollTop(height);

      // Clear field after submit
      if (data.sender_id == currrent_user_id) {
        $('#message_field').val('');
      }
    },

    renderMessage: function(data) {
      // Update in recipients' list
      var li_tag = $('li[data-conversation-id="+data.conversation_id+"]');
      var last_message_tag = li_tag.find($('.last_message'));
      last_message_tag.html(data.body);

      // Update in messages' column
      if (currrent_user_id == data.sender_id) {
        li_tag.find($('.messages_status_icon')).html('<div class="replied"><i class="icon ion-reply"></i></div>');
        return data.message_for_sender;
      }
      li_tag.find($('.messages_status_icon')).html('<div class="seen"><i class="icon ion-checkmark-round"></i></div>');
      return data.message_for_recipient;
    }
  });
})
