
root = window || @

class root.CategoryListView extends Backbone.View

  events:
    'click .link_new_category'   : 'new_one'
    'submit .form_new_category' : 'create_one'

  initialize: (options) ->
    _.extend(@, options)
    @new_category_el = @$el.find('.template_new_category')

  new_one: () ->
    @new_category_el.slideToggle()

  create_one: () ->
    $form = @$el.find('.form_new_category')
    url = $form.attr('action')

    $.ajax
      url: url,
      type: 'POST',
      dataType: 'json',
      data: $form.serialize(),
      success: (data, status, xhr) =>
        document.location.reload()
      error: (xhr, status, error) =>
        alert(xhr.responseText)
    false
