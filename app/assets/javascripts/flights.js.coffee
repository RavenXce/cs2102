# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on('ready page:change',()->
  $('.datepicker').datepicker()
  $('#fromDate').datepicker('setValue', Date.now())
  $('.touchspin').TouchSpin(
    min: 0
    prefix: ' '
  )
  $('.bootstrap-touchspin-prefix').addClass('glyphicon glyphicon-user')
)