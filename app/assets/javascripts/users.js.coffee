$ ->
  closeModal = (link, modal, option=null, option2=null) ->
    $( document ).on('click', link, ->
      $(modal).fadeOut()
      $(option).fadeOut() if option
      $(option2).fadeIn() if option2
    
      false
    )
  openModal = (link, modal, option=null, option2=null) ->
    $( document ).on('click', link, ->
      $(modal).fadeIn()
      $(option).fadeIn() if option
      $(option2).fadeOut() if option2
      false
    )

  closeModal "#close-modal", "#modal", "#modal-back", "#map-wrapper"
  openModal "#new-profile", "#modal", "#modal-back", "#map-wrapper"

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
