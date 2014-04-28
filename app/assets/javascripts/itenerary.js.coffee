
$( document ).on("click", "#city-image", -> 
  $("#full-image").attr("src", this.src)
  $("#full-image").fadeIn()
  $("#image-modal").fadeIn()
  $("#city-title").html(this.alt)
  $("#trip").fadeOut()
  false
)

$( document ).on("click", "#close-image-modal", -> 
  $("#image-modal").fadeOut()
  $("#trip").fadeIn()
  false
)

$( document ).on("click", ".city-list", ->
  $("#city-title").html(this.id)
)


