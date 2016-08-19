class @Lever
  constructor: ->

  switch: (e, state) =>
    lever = $(e.target).parent()
    return lever.addClass "on" unless state is ''
    lever.removeClass "on"
    