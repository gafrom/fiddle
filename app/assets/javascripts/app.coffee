@App = {}

class @App
  constructor: ->
    @controller = new App.Controller()

  start: =>
    @controller.initiateAvatarLoads()
    @controller.configureAnimation()
    @controller.initiateSmartFields()

class @App.Controller
  constructor: ->
    @backend = new App.Backend(@)
    @gui = new App.Gui(@)
    

  initiateAvatarLoads: =>
    $(document).on 'turbolinks:load', =>
      avatars = $('[data-avatar]')
      for avatar in avatars
        url = $(avatar).data 'avatar'
        @gui.setImage avatar, url

  configureAnimation: =>
    $(document).on 'turbolinks:load', =>
      ul = $('ul.fallable')
      delay = 0.0
      for li in ul.children()
        $(li).css 'animationDelay', "#{delay += 0.05}s"

  initiateSmartFields: =>
    $(document).on 'turbolinks:load', => new SmartField(@backend)

class @App.Gui
  constructor: ->

  setImage: (element, url) =>
    $(element).css 'background-image', "url(#{url})"

class @App.Backend
  constructor: (@controller) ->

  create: (data) =>
    o = Object.keys(data)[0]
    $.ajax
      type: "POST"
      url: "#{o}s"
      data: data
      error: (xhr, text, msg) => @rescue "create #{o}", xhr, msg

  update: (id, data) =>
    o = Object.keys(data)[0]
    $.ajax
      type: "PATCH"
      url: "#{o}s/#{id}"
      data: data
      error: (xhr, text, msg) => @rescue "update #{o}'s name", xhr, msg

  toggleUser: (id) =>
    $.ajax
      type: "PATCH"
      url: "users/#{id}"
      data:
        task: 'toggle'
      error: (xhr, text, msg) => @rescue 'toggle user', xhr, msg

  rescue: (action, error, text) =>
    msg = "#{error.status} #{text}<br\/><br\/>Error occurred when trying to #{action}."
    new Flash 'error', msg, error

$ ->
  app = new App()
  app.start()
