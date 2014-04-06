$ ->

#this effect takes 4 arguments
#the first is the 'div' that is intended to be faded
#the second 'tall' is the integer to be multiplied by the divs height
#like for the second div you would multiply by 2
#the third arg 'adjustment' is to start the fade before the
#div is out of sight
#the fourth is a lambda option with default null
#this arg must be a funtion in this case i want the globe to
#reappear in the first div but not the others

  scrollEffect = (div, tall, adjustment, option=null) ->
    $(window).scroll( ->
      x = $( div ).height() * tall
      if $( this ).scrollTop() > x - adjustment
        $( div ).animate({opacity: 0.3})
        $( "#globe" ).fadeOut()
      else
        $( div ).finish()
        $( div ).animate({opacity: 1.0})
        do option if option
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

