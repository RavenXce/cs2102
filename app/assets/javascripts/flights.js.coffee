# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on('ready page:change', () ->
  $('.datepicker').datepicker()
  $('#fromDate').datepicker('setValue', Date.now())
  $('#toDate').datepicker('setValue', Date.now())
  
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
)

updateTwoWayStatus = () ->
  if $('#twoWayBtn').hasClass('active') 
    $('#twoWay').val('true')
    $('.to-date').show()
  else
    $('#twoWay').val('false')
    $('.to-date').hide()
  
