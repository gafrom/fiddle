class @App.Controller

  configureAnimation: =>
    @assignDelays $('.slidable')
    @assignDelays $('.fallable')

    firstField = $('.slidable.first')
    firstField.one 'animationstart webkitAnimationStart mozanimationstart MSAnimationStart oanimationstart', ->
      setTimeout (-> firstField.find('input').first().focus()), 1000

  initiateClickEvents: ->
    form = $('form')
    input = form.find('input[type=file]')
    
    $('.btn_upload').on 'click', ->
      new Popup() unless input[0].files.length is 0
      form.submit()

  assignDelays: (elems) ->
    delay = 0.0
    for elem in elems
      $(elem).css 'animationDelay', "#{delay += 0.05}s"
