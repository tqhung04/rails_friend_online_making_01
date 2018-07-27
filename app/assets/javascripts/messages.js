$(document).ready(function() {
  var messages_scrollbar = $('#messages_scrollbar');
  var height = messages_scrollbar[0].scrollHeight;
  messages_scrollbar.scrollTop(height);
})

