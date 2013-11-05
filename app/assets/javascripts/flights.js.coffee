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
  
  $('.btn-group .btn').on('click', () ->
    $(this).siblings().toggleClass('active')
    $(this).toggleClass('active')
    if $('#twoWayBtn').hasClass('active') 
      $('#two_way').val('true')
    else
      $('#two_way').val('false')
  );
)