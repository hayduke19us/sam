$ ->
  $("#close_modal").click( ->
    $("#modal").toggle()
    $("#modal-back").toggle()
    false
  )

  $("#correct_city").click( ->
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



