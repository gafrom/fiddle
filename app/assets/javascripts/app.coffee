@App ||= {}

class @App
  constructor: ->
    @controller = new App.Controller()

  start: =>
    $(document).on 'turbolinks:load', =>
      @controller.initiateClickEvents()
      @controller.configureAnimation()

$ ->
  app = new App()
  app.start()
