$(document).ready(function() {
  var messages_scrollbar = $('#messages_scrollbar');
  if (typeof(messages_scrollbar[0]) != "undefined") {
    var height = messages_scrollbar[0].scrollHeight;
    messages_scrollbar.scrollTop(height);
  }
})
