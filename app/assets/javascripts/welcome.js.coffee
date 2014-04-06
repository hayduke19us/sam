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

  safe = (id) ->
    x = $(id).html()
    $("#safe-description").html(x)
    $("#safe-description").fadeIn()

  clickable = (tag, info) ->
    $(tag).click( ->
      complete = ->
        safe info
      $("#safe-description").fadeOut( complete )
      false
    )

  clickable "#guard", "#guard-info"
  clickable "#scribe", "#scribe-info"
  clickable "#grandma", "#grandma-info"

