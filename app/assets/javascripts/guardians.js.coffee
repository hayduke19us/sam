
$(document).on("click", "#recent", ->
  $("#nav").toggle("fade")
  $("#recent-nav").toggle("fade")
)

$(document).on("click", "#recent-nav a", ->
  $(".active").attr("class", "button tiny")
  $(this).attr("class", "button small active")
)
