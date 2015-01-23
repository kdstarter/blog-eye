
#= require shared/utils

root = window || @

class root.PostBoothView extends Backbone.View

  events:
    'click .fast_reply_at'   : 'fast_reply_at'

  initialize: (options) ->
    _.extend(@, options)
    @reply_content = @$el.find('#reply_content')

  fast_reply_at: (event) ->
    at_str = $(event.target).attr('data-at')
    @reply_content.val(@reply_content.val() + at_str).focus()

