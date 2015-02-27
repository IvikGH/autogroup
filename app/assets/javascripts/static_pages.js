$(document).ready(function() {
  var node1 = $('#DetailsImport .select-dropdown'),
      button1 = $('#DetailsImport .submitButtn'),
      node2 = $('#RabatImport .select-dropdown'),
      button2 = $('#RabatImport .submitButtn');
  button1.prop( "disabled", true );
  button2.prop( "disabled", true );

  node1.on ( 'mouseenter', function() {
    button1
      .prop( 'disabled', false )
      .attr( 'class', "attention" );
  })
  button1.on( 'mouseenter', function() {
    $(this)
      .prop( "disabled", !node1.val() )
      .removeClass( 'attention');
  });

  node2.on ( 'mouseenter', function() {
    button2.prop( 'disabled', false );
  })
  button2.on( 'mouseenter', function() {
    $(this).prop( "disabled", !node2.val() );
  });
});
