
$( document ).on("click", "#city-image", -> 
  $("#full-image").attr("src", this.src)
  $("#image-modal").fadeIn()
  false
)

