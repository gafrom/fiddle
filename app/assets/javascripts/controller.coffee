class @App.Controller

  configureAnimation: =>
    @assignDelays $('.slidable')
    @assignDelays $('.fallable')

    firstField = $('.slidable.first')
    firstField.one 'animationstart webkitAnimationStart mozanimationstart MSAnimationStart oanimationstart', ->
      setTimeout (-> firstField.find('input').first().focus()), 1000

  initiateClickEvents: ->
    form = $('form')
    $('.btn_upload').on 'click', ->
      form.submit()

  assignDelays: (elems) ->
    delay = 0.0
    for elem in elems
      $(elem).css 'animationDelay', "#{delay += 0.05}s"
