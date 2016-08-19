class @App.Backend
  constructor: (@controller) ->
    console.log 'App Backend started'

  create: (data) =>
    o = Object.keys(data)[0]
    $.ajax
      type: "POST"
      url: "#{o}s"
      data: data
      error: (xhr, text, msg) => @rescue "create #{o}", xhr, msg

  rescue: (action, error, text) =>
    msg = "#{error.status} #{text}<br\/><br\/>Error occurred when trying to #{action}."
    new Flash 'error', msg, error
