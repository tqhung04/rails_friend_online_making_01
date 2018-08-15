//= require jquery
//= require jquery3
//= require bootstrap-slider
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

// Fuction for map initialization
function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
}

function toggle_message(tag, status, message) {
    html = '<div class="alert alert-' + status +'"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> ' + message + '</div>';
    $(tag).html(html);
}
