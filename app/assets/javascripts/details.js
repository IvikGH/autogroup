(function($){
  $(function(){
    $('.detquantity').on('change', function() {
      $.ajax({
        url: '/details/' + $(this).attr('data-detail_id') + '/quantity_to_cart',
        type: 'POST',
        data: { _method: 'PUT', quantity: $(this).val() }
      });
    })
  }); // end of document ready
})(jQuery); // end of jQuery name space
