class this.Flash
  constructor: (@how, @message, @error) ->
    @show()

  show: =>
    if @error?
      details = @error.responseJSON
      @message += "<br \/><br \/>#{details}" if details?
    
    flash = $(document.createElement "p")
    flash.addClass "flash-message message-#{@how}"
    flash.html @message
    $(document.body).prepend flash
    flash.show()
    @killLater flash


  killLater: (element) =>
    setTimeout(( => element.remove()), 4000)
