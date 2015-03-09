(function($){
  $(function(){
    $('.detquantity').on('keyup', function() {
      // var current_detail_tr = ('/details/' + $(this).attr('data-detail_id') + '/quantity_to_cart?useer=' + $('#devise').attr('data-user_id'));
        // console.log( current_detail_tr );

      // http://localhost:3000/details/665790/quantity_to_cart?user=3

      $.ajax({
        url: '/details/' + $(this).attr('data-detail_id') + '/quantity_to_cart?user=' + $('#devise').attr('data-user_id'),
        type: 'POST',
        data: { _method: 'PUT', quantity: $(this).val() },
        success: function() {
          // console.log(result);
        }
      });
    })
  }); // end of document ready
})(jQuery); // end of jQuery name space
