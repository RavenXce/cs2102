# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on('ready page:change', () ->
  $('.datepicker').datepicker()
  $('.datepicker').datepicker('setValue', Date.now())  
  $('.chosen-select').chosen(
    width: "178px"
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
    $('<form action="bookings" method="GET">' + 
    '<input type="hidden" name="destination" value="' + imgnum + '">' +
    '<input type="hidden" name="origin" value="' + imgnum + '">' +
    '<input type="hidden" name="is_two_way" value="' + imgnum + '">' +
    '<input type="hidden" name="flight_ids" value="' + imgnum + '">' +
    #pax? passengers? users?
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
  
