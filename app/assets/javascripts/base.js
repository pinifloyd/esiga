$(function($) {

  $(document).on('click', '.x_submit_btn', function(e) {
    e.preventDefault();
    $(this).closest('form').submit();
  });

});
