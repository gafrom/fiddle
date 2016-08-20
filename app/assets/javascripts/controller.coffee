class @App.Controller
  constructor: ->
    console.log 'App Controller started'
    @backend = new App.Backend(@)
    @gui = new App.Gui(@)

  configureAnimation: =>
    @assignDelays $('.slidable')
    @assignDelays $('.fallable')

  initiateClickEvents: ->
    form = $('form')
    $('.btn_upload').on 'click', ->
      form.submit()

  assignDelays: (elems) ->
    delay = 0.0
    for elem in elems
      $(elem).css 'animationDelay', "#{delay += 0.05}s"
