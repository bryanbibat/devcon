# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  replaceRetina = (elem) ->
    if elem.complete
      src = elem.src
      path_segments = src.split(".")
      path_without_extension = path_segments.slice(0, (path_segments.length - 1)).join(".")
      extension = path_segments[path_segments.length - 1]
      elem.setAttribute "width", elem.offsetWidth
      elem.setAttribute "height", elem.offsetHeight
      elem.setAttribute "src", path_without_extension + "@2x." + extension
    else
      setTimeout (->
        replaceRetina elem
      ), 5

  if window.devicePixelRatio > 1
    $(".retina").each (i) ->
      replaceRetina this

  $('#sidebar').affix({
    offset:
      top: 30
      bottom: ->
        return (this.bottom = $('.footer').outerHeight(true))
  })

