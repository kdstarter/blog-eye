
#= require shared/utils

root = window || @

class root.UserRegisterView extends Backbone.View

  events:
    'blur input#user_uid'   : 'is_uid_exist'

  is_uid_exist: () ->
    uid = $(event.target).val().trim()
    return unless uid.length >= 3

    $.ajax
      url: '/admin/is_uid_exist',
      type: 'POST',
      dataType: 'json',
      data: { uid: uid },
      success: (data, status, xhr) =>
        
      error: (xhr, status, error) =>
        alert(xhr.responseText)

