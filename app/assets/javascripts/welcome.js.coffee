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

  $("#guardian-title").click( ->
    complete = -> (
      $("#guard-info").fadeIn("slow")
     )
    $("#scribe-info").fadeOut( complete ) if $("#scribe-info")
    $("#grandma-info").fadeOut( complete ) if $("#grandma-info")
    false
   )

  $("#scribe-bt").click( ->
    complete = -> (
      $("#scribe-info").fadeIn("slow")
    )
    $("#guard-info").fadeOut( complete ) if $("#guard-info")
    $("#grandma-info").fadeOut( complete ) if $("#grandma-info")
    false
   )

  $("#grandma-bt").click( ->
    complete = -> (
      $("#grandma-info").fadeIn("slow")
    )
    $("#guard-info").fadeOut()
    $("#scribe-info").fadeOut( complete )
    false
   )

