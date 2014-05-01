
$( document ).on("click", "#city-image", -> 
  $("#full-image").attr("src", this.src)
  $("#full-image").fadeIn()
  $("#image-modal").fadeIn()
  $("#city-title").html(this.alt)
  $("#content-wrapper").fadeOut()
  $("#for-parents-link").fadeOut()
  $("#dashboard-link").fadeOut()
  $("#map-link").fadeOut()
  false
)

$( document ).on("click", "#close-image-modal", -> 
  $("#image-modal").fadeOut()
  $("#content-wrapper").fadeIn()
  $("#for-parents-link").fadeIn()
  $("#dashboard-link").fadeIn()
  $("#map-link").fadeIn()
  false
)

$( document ).on("click", "#map-link", ->
  complete = ->
    $("#close-map-wrap").fadeIn()
  $(this).fadeOut()
  $("#for-parents-link").fadeOut()
  $("#dashboard-link").fadeOut()
  $("#photo-wall").fadeOut()
  $("#content-wrapper").fadeOut( complete )
  $("#grayscale-wrapper").css("opacity", 1.0)
  $("#blur-wrapper").fadeOut()
  false
)

$( document ).on("click", "#close-map-link", ->
  complete = ->
    $("#for-parents-link").fadeIn()
    $("#dashboard-link").fadeIn()
    $("#map-link").fadeIn()
    $("#photo-wall").fadeIn()
    $("#content-wrapper").fadeIn()
    $("#blur-wrapper").fadeIn()
  $("#close-map-wrap").fadeOut( complete )
  false
)

$( document ).on("click", "#info-link", ->
  $("#wiki").toggle("fade")
  false
)


