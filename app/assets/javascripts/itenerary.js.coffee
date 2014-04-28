
$( document ).on("click", "#city-image", -> 
  $("#full-image").attr("src", this.src)
  $("#full-image").fadeIn()
  $("#image-modal").fadeIn()
  false
)

$( document ).on("click", "#close-image-modal", -> 
  $("#image-modal").fadeOut()
  false
)


