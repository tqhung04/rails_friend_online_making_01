function readURL(input) {

  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function(e) {
      $('#blah').show();
      $('#blah').attr("src", e.target.result);
    }

    reader.readAsDataURL(input.files[0]);
  }
}

$('#public_form_user_avatar').change(function() {
  readURL(this);
});
