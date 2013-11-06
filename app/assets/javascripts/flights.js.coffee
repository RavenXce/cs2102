# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on('ready page:change', () ->
  $('.datepicker').datepicker('setValue', Date.now()) 
  $('.chosen-select').chosen(
    width: "100%"
  )  
  $('.touchspin').TouchSpin(
    min: 1
    prefix: ' '
  )
  $('.bootstrap-touchspin-prefix').addClass('glyphicon glyphicon-user')
  
  updateTwoWayStatus()
  $('.btn-group .btn').on('click', () ->
    $(this).siblings().toggleClass('active')
    $(this).toggleClass('active')
    updateTwoWayStatus()
  );
  
  $('#book-btn').on('click', () ->
    $this = $(this)
    $form = $this.parents('table')
    $('<form action="bookings" method="POST">' +
    '<input type="hidden" name="authenticity_token" value="' + AUTH_TOKEN + '">' + 
    '<input type="hidden" name="destination" value="' + $form.data('destination') + '">' +
    '<input type="hidden" name="origin" value="' + $form.data('origin') + '">' +
    '<input type="hidden" name="is_two_way" value="' + $form.data('two-way')+ '">' +
    '<input type="hidden" name="pax" value="' + $form.data('pax') + '">' +
    '<input type="hidden" name="flight_ids" value="' + $this.parents('tr').data('flight-ids') + '">' +    
    '<input type="hidden" name="price" value="' + $this.parents('tr').data('price') + '">' + #XXX: bad
    '</form>').submit();
  );
)

updateTwoWayStatus = () ->
  if $('#twoWayBtn').hasClass('active') 
    $('#twoWay').val('true')
    $('.to-date').show()
  else
    $('#twoWay').val('false')
    $('.to-date').hide()
  
