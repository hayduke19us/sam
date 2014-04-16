$ ->
  closeModal = (link, modal, option=null, option2=null, option3=null) ->
    $( document ).on('click', link, ->
      $(modal).fadeOut()
      $(option).fadeOut() if option
      $(option2).fadeIn() if option2
      $(option3).fadeIn() if option2
      false
    )
  openModal = (link, modal, option=null, option2=null, option3=null) ->
    $( document ).on('click', link, ->
      $(modal).fadeIn()
      $(option).fadeIn() if option
      $(option2).fadeOut() if option2
      $(option3).fadeOut() if option2
      false
    )

  closeModal "#close-modal", "#modal", "#modal-back", "#map-wrapper", "#side-bar"
  openModal "#new-profile", "#modal", "#modal-back", "#map-wrapper", "#side-bar"

  $( document ).on('click', "#correct-city", ->
    $("#city").toggle()
    false
  )

  showLogin = (link, div1, div2) ->
    $( document ).on('click', link, ->
      complete = ->
        $(div1).fadeIn()
        false
      $(div2).fadeOut( complete )
      false
     )

  showLogin "#map-options", "#dash-controls", "#map-controls"
   
  $( document ).on("click", "#dashboard", ->
     $("#dashboard").toggle()
     $("#side-bar").toggle() 
     false
   )

  $( document ).on( "click", "#close-side", ->
    complete = ->
      $("#dashboard").fadeIn()
    $("#side-bar").fadeOut( complete )
    false
  )
