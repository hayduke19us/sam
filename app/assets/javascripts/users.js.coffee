$ ->
  $( document ).on('click', "#close-modal", ->
    $("#modal").fadeOut()
    $("#modal-back").fadeOut()
    false
  )

  $( document ).on('click', "#correct-city", ->
    $("#city").toggle()
    false
  )

  showLogin = (link, div1, div2) ->
    $( document ).on('click', link,  ->
      complete = ->
        $(div1).fadeIn()
        false
      $(div2).fadeOut( complete )
      false
    )



