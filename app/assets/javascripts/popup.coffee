class @Popup
  constructor: ->
    popup = $(@html())
    $(document.body).prepend popup
    
  html: =>
    "
    <div class='popup__wrapper'>
      <span class='popup__inner'>
        <span class='popup__inner_shifted icon-spin1 animate-spin'></span>
      </span>
    </div>
    "
