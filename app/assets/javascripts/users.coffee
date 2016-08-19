User = {}

class User.App
  constructor: ->
    @controller = new User.Controller()

  start: =>
    @controller.initiateClickEvents()

class User.Controller
  constructor: ->
    @backend = new App.Backend(@)
    #@gui = new User.Gui(@)
    

  initiateClickEvents: =>
    $(document).on 'turbolinks:load', =>
      $(".lever-inner").click (e) => @toggle e
  
  toggle: (e) =>
    user_id = $(e.target).parent().parent().data 'id'
    @lever ?= new Lever()

    #@lever.switch e, true
    @backend.toggleUser(user_id).done((state) => @lever.switch e, state)


$ ->
  app = new User.App()
  app.start()
