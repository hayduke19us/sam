$ ->
  $(window).scroll( ->
    if $(this).scrollTop() > 800 
      $(".banner").animate({opacity: 0.3}, "fast")
      $("#globe").fadeOut()
    else
      $(".banner").finish()
      $(".banner").animate({opacity: 1.0}, "fast")
      $("#globe").fadeIn("slow")
   )

  class safe
    constructor: (id) -> (
      x = $(id).html()
      $("#safe-description").html(x)
      $("#safe-description").fadeIn()
    )

  $("#guard-bt").click( ->
    complete = -> (
      safe "#guard-info"
    )
    $("#safe-description").fadeOut( complete )
    false
  )

  $("#scribe-bt").click( ->
    complete = -> (
      safe "#scribe-info"
    )
    $("#safe-description").fadeOut( complete )
    false
   )

  $("#grandma-bt").click( ->
    complete = -> (
      safe "#grandma-info"
    )
    $("#safe-description").fadeOut( complete )
    false
   )

