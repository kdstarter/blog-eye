
#= require jquery
#= require jquery-ui
#= require jquery_ujs
#= require shared/underscore
#= require shared/backbone
#= require shared/bootstrap
#= require shared/pnotify.all.min

# PNotify.prototype.options.styling = "jqueryui"

root = window || @

root.pnotify_xhr = (type, xhr, title=null) ->
  try
    message = xhr.responseJSON.message
  catch error
    message = xhr.responseText

  PNotify.removeAll()

  if type == 'error'
    title ||= 'Uh Oh!'
    new PNotify
      title: title,
      type: type,
      hide: false,
      text: message

  else
    title ||= 'Uh Wow!'
    new PNotify
      title: title,
      type: type,
      hide: true,
      text: message

