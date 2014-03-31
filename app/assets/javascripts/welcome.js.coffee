# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#

$("#what").hover( ->
  $("#whatQuestion").toggle("show")
  )
$("#when").hover( ->
  $("#whenQuestion").toggle("hide")
  )
$("#where").hover( ->
  $("#whereQuestion").toggle("hide")
  )
$("#why").hover( ->
  $("#whyQuestion").toggle("hide")
  )
$("#how").hover( ->
  $("#howQuestion").toggle("hide")
  )


