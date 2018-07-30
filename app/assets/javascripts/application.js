//= require jquery
//= require jquery3
//= require turbolinks
//= require rails-ujs
//= require jquery.appear.min
//= require jquery.incremental-counter
//= require jquery.scrollbar.min
//= require jquery.sticky-kit.min
//= require masonry.pkgd.min
//= require rails-ujs
//= require script
//= require bootstrap
//= require_self
//= require cable

function remove_all_streams() {
  if (App.messages) App.cable.subscriptions.remove(App.messages);
  if (App.strangers) App.cable.subscriptions.remove(App.strangers);
};
