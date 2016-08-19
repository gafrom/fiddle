# required attribute for constructor is 
# Backend class with update(value, id) method

class @SmartField
  constructor: (@backend) ->
    fields = $(".smart-field")
    for f in fields
      $(f).data 'old-value', $(f).val()
      @setWidth f unless $(f).hasClass 'add'
    fields.on 'input',   (e) => @tryChangeValue(e)
    fields.on 'keydown', (e) => @handleKeydown(e)
    fields.on 'keyup',   (e) => @handleKeyup(e)
    
  setWidth: (element) =>
    w = $(element).val().length*13 + 5
    w = 55 if w < 55
    $(element).css 'width', "#{w}px"

  tryChangeValue: (e) =>
    elem = e.target
    @setWidth elem
    
    id = $(elem).data 'id'
    $(elem).off 'blur'

    return @newField(elem) if id is undefined

    if @check elem.value
      $(elem).removeClass 'wrong-value'
      @backend.update(id, {office: { name: elem.value }}).done( => @flashSuccess(elem) )

      $(elem).one 'blur', (e) => @updateValue(e)
    else
      $(elem).addClass 'wrong-value'
      $(elem).one 'blur', (e) => @setDefaultValue(e)
      
  newField: (elem) =>
    $(elem).one 'blur', =>
      @backend.create({office: { name: elem.value }}).done((respond) => @createField(respond, elem))

  createField: (data, inputOld) =>
    li = $(inputOld).parent().clone true
    input = li.children().first()
    input.attr 'placeholder', ' + '
    input.val ''
    li.css 'animation-delay', 'initial'

    $(inputOld).removeAttr 'data-id'
    $(inputOld).data 'old-value', data.name
    $(inputOld).data 'id', data.id
    $(inputOld).parent().parent().append li

  check: (str) =>
    return false if str is ''
    true

  setDefaultValue: (e) =>
    elem = e.target
    id = $(elem).data 'id'
    switch id
      when undefined
        $(elem).off 'blur'
      else
        old = $(elem).data 'old-value'
        @backend.update old, id
        
    $(elem).val old
    @setWidth elem
    $(elem).removeClass 'flashed-success wrong-value'
    $(elem).addClass 'shake'
    setTimeout(( => $(elem).removeClass('shake')), 700)
  
  updateValue: (e) =>
    elem = e.target
    $(elem).data 'old-value', elem.value

  flashSuccess: (elem) =>
    $(elem)
      .removeClass('wrong-value flashed-success')
      .width()  # MAGIC !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    $(elem).addClass 'flashed-success'

  handleKeyup: (e) =>
    switch e.keyCode
      when 13 then e.target.blur()
      when 27
        @setDefaultValue(e)
        e.target.blur()

  handleKeydown: (e) =>
    e.preventDefault() if e.keyCode is 13
