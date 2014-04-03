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
