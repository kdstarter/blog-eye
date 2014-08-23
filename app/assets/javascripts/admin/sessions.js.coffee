
#= require shared/utils

root = window || @

class root.UserRegisterView extends Backbone.View

  events:
    'blur input#user_uid'   : 'validate_exist'

  validate_exist: () ->
    uid = $(event.target).val().trim()

