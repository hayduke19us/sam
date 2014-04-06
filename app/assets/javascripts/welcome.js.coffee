$ ->

  scrollEffect = (div, tall, adjustment, option=null) ->
    $(window).scroll( ->
      x = $(div).height() * tall
      if $(window).scrollTop() > x - adjustment
        $(div).animate({opacity: 0.3})
        $("#globe").fadeOut()
      else
        $(div).finish()
        $(div).animate({opacity: 1.0})
        do option if option not null
    )

  globeFadeIn = ->
    $(globe).fadeIn("slow")

  scrollEffect ".banner", 1, 200, globeFadeIn 
  scrollEffect ".dark-banner", 2, 100



  $("#parents-link").click( ->
    $( window ).scrollTop( $( "div.banner").height() ) 
    false
  )

  showDescription = (id) ->
    x = $(id).html()
    $("#safe-description").html(x)
    $("#safe-description").fadeIn()

  clickable = (tag, info) ->
    $(tag).click( ->
      complete = ->
        showDescription info
      $("#safe-description").fadeOut( complete )
      false
    )

  clickable "#guard", "#guard-info"
  clickable "#scribe", "#scribe-info"
  clickable "#grandma", "#grandma-info"

  $("#top").click( -> 
    $( window ).scrollTop( 0 )
    false
  )

