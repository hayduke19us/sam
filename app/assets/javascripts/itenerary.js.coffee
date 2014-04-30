
$( document ).on("click", "#city-image", -> 
  $("#full-image").attr("src", this.src)
  $("#full-image").fadeIn()
  $("#image-modal").fadeIn()
  $("#city-title").html(this.alt)
  $("#content-wrapper").fadeOut()
  $("#for-parents-link").fadeOut()
  $("#dashboard-link").fadeOut()
  false
)

$( document ).on("click", "#close-image-modal", -> 
  $("#image-modal").fadeOut()
  $("#content-wrapper").fadeIn()
  $("#for-parents-link").fadeIn()
  $("#dashboard-link").fadeIn()

  false
)

$( document ).on("click", ".city-list", ->
  $("#city-title").html(this.id)
)

$( document ).on("click", "#map-link", ->
  $("#content-wrapper").fadeOut()
  $("#for-parents-link").fadeOut()
  $("#dashboard-link").fadeOut()
  $("#photo-wall").fadeOut()
  $(this).fadeOut()
  $("#close-map-wrap").fadeIn()
  false
)

$( document ).on("click", "#close-map-link", ->
  $("#content-wrapper").fadeIn()
  $("#for-parents-link").fadeIn()
  $("#dashboard-link").fadeIn()
  $("#photo-wall").fadeIn()
  $("#close-map-wrap").fadeOut()
  $("#map-link").fadeIn()
  false
)


