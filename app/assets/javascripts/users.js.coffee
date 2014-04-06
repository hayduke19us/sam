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


