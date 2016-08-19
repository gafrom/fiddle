@App ||= {}

class @App
  constructor: ->
    console.log 'App started'
    @controller = new App.Controller()

  start: =>
    @controller.initiateClickEvents()
    @controller.configureAnimation()

$ ->
  app = new App()
  app.start()
