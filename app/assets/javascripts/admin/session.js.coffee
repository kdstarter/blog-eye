
#= require shared/utils

root = window || @

class root.UserRegisterView extends Backbone.View

  events:
    'blur input#user_uid'   : 'is_uid_exist'

  initialize: () ->
    @last_uid = null

  is_uid_exist: (event) ->
    uid = $(event.target).val().trim()
    # check if uid changed and length eg 3
    return unless uid.length >= 3 && uid != @last_uid

    @last_uid = uid
    $.ajax
      url: '/admin/is_uid_exist',
      type: 'POST',
      dataType: 'json',
      data: { uid: uid },
      success: (data, status, xhr) =>
        pnotify_xhr('info', xhr)
      error: (xhr, status, error) =>
        pnotify_xhr('error', xhr)

