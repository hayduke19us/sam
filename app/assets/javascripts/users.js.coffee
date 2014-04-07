$ ->
  closeModal = (link, modal, option=null) ->
    $( document ).on('click', link, ->
      $(modal).fadeOut()
      $(option).fadeOut() if option
      false
    )
  openModal = (link, modal, option=null) ->
    $( document ).on('click', link, ->
      $(modal).fadeIn()
      $(option).fadeIn() if option
      false
    )

  closeModal "#close-modal", "#modal", "#modal-back"
  openModal "#new-profile", "#modal", "#modal-back"

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



