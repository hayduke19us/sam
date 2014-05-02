
$(document).on("click", "#recent", ->
  $("#nav").toggle("fade")
  $("#recent-nav").toggle("fade")
  false
)

$(document).on("click", "#recent-nav a", ->
  $(".active").attr("class", "button tiny")
  $(this).attr("class", "button small active")
)

$(document).on("click", "#interaction-list a", ->
  id = "#" + this.id + "-info"
  $(".active-info").toggle("fade")
  $(".active-info").removeClass("active-info")
  $(id).addClass("active-info")
  $(".active-info").toggle("fade")
  false
)
