class @App.Controller
  constructor: ->
    console.log 'App Controller started'
    @backend = new App.Backend(@)
    @gui = new App.Gui(@)
    

  configureAnimation: =>
    $(document).on 'turbolinks:load', =>
      ul = $('ul.fallable')
      delay = 0.0
      for li in ul.children()
        $(li).css 'animationDelay', "#{delay += 0.05}s"

  initiateClickEvents: =>
    form = $('form')
    $('.btn_upload').on 'click', ->
      form.submit()
