if (App.strangers) App.cable.subscriptions.remove(App.strangers);

$('form.edit_user').submit(function(event) {
  $('.finding').show();
  $('form.edit_user').hide();
});
