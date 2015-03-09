(function($){
  $(function(){
    $('.detquantity').on('keyup', function() {
      $.ajax({
        url: '/details/' + $(this).attr('data-detail_id') + '/quantity_to_cart?user=' + $('#devise').attr('data-user_id'),
        type: 'POST',
        data: { _method: 'PUT', quantity: $(this).val() },
        success: function() {
        }
      });
    })
  }); // end of document ready
})(jQuery); // end of jQuery name space
