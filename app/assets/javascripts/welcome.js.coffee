# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$('#carousel-main').carousel(
  interval: 300
)
$(document).on('ready page:change',()->
  $('#carousel-main').carousel('cycle')
)