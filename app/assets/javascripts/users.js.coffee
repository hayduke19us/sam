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

  showDiv = (link, div1, div2) ->
    $( document ).on("click", link, ->
      complete = ->
        $(div2).fadeIn()
      $(div1).fadeOut( complete )
      false
     )

  showDiv "#map-options", "#dash-controls", "#map-controls"
  showDiv "#back-dashboard", "#map-controls", "#dash-controls"

  $( document ).on("click", "#dashboard", ->
     $("#side-bar").toggle() 
     false
   )

  $( document ).on( "click", "#close-side", ->
    $("#side-bar").fadeOut()
    false
  )

  $( document ).on('click', "#correct-city", ->
    $("#city").toggle()
    false
  )

