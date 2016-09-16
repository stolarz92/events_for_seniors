# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  cycleBackgrounds()
  return

cycleBackgrounds = ->
  $imageDiv = $('.bg-image')
  # Get the images to be cycled.
  setInterval (->
    if $imageDiv.hasClass('bg-image-first')
      # $imageDiv.switchClass('bg-image-first', 'bg-image-second', 5000, "easeInOutQuad");
      
      $imageDiv.addClass('bg-image-second', 1000).removeClass('bg-image-first', 1000);
    else
      # $imageDiv.switchClass('bg-image-second', 'bg-image-first', 5000, "easeInOutQuad");
      $imageDiv.addClass('bg-image-first', 1000).removeClass('bg-image-second', 1000);
    return
  ), 5000
  return
