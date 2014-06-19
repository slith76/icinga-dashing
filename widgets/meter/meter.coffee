class Dashing.Meter extends Dashing.Widget

  @accessor 'value', Dashing.AnimatedValue

  constructor: ->
    super
    @observe 'value', (value) ->
      $(@node).find(".meter").val(value).trigger('change')

  ready: ->
    meter = $(@node).find(".meter")
    meter.attr("data-bgcolor", meter.css("background-color"))
    meter.attr("data-fgcolor", meter.css("color"))
    meter.knob()


  onData: (data) ->
    if data.status
      $(@get('node')).attr 'class', (i,c) ->
        c.replace /\bstatus-\S+/g
      $(@get('node')).addClass "status-#{data.status}"

##Meine Möglichkeit
##
#  onData: (data) ->
#    if data.status == "warning"
#      $(@node).css('background-color','#ede61a')
#      $(@node).css('title-color','rgba(0, 0, 0, 1)')
#    if data.status == "danger"
#      $(@node).css('background-color','#b51222')
#      $(@node).css('title-color','rgba(255, 255, 255, 0.7)')
#      $(@node).css('meter-background','darken(#ede61a, 15%)')
#      $(@node).css('value-color','#fff')
