
#= require shared/utils
#= require ckeditor/init
#= require admin/categories

root = window || @

class root.MessageListView extends Backbone.View
  events:
    'click tr .btn_mark_read' : 'mark_as_read'

  mark_as_read: (event) ->
    @btn_mark_read = $(event.target)
    @btn_mark_read.attr('disabled', 'disabled')

    id = @btn_mark_read.parents('tr').attr('data-id')
    url = "/admin/messages/#{id}/mark_as_read"

    $.ajax
      url: url,
      type: 'POST',
      dataType: 'json',
      success: (data, status, xhr) =>
        $('.link_admin_messages>span').text(data.count)
        @btn_mark_read.removeClass('btn-success').text('已读')
      error: (xhr, status, error) =>
        @btn_mark_read.removeAttr('disabled')
        alert(xhr.responseText)
