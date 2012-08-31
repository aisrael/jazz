# http://stackoverflow.com/questions/4214731/coffeescript-global-variables
root = exports ? this
root.decorate_minus_button = (e) ->
  e.click ->
    target_name = $(this).data('for')
    target = $('input#'+target_name)
    min = if target.attr('min') then target.attr('min') else 0
    if target.val()
      val = Math.max(min, parseInt(target.val(), 10) - 1)
      target.val(val)

root.decorate_plus_button = (e) ->
  e.click ->
    target_name = $(this).data('for')
    target = $('input#'+target_name)
    max = if target.attr('max') then target.attr('max') else 99
    if target.val()
      val = Math.min(max, parseInt(target.val(), 10) + 1)
      target.val(val)

$ ->
  decorate_minus_button($('form a.jazz.btn.minus'))
  decorate_plus_button($('form a.jazz.btn.plus'))
  
  # Make table rows with data-target attributes clickable
  $('tr[data-target]').click (e) ->
    src = e.srcElement || e.originalEvent.originalTarget
    if 'TD' == src.tagName
      window.location = $(this).data('target')
