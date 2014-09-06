
module Features
  module BlogAdminHelpers
    def link_admin_home
      browser.link(class: 'link_admin_home')
    end

    def link_admin_categories
      browser.link(class: 'link_admin_categories')
    end

    def link_new_category
      browser.link(class: 'link_new_category')
    end

    def link_edit_category
      browser.link(class: 'link_edit_category')
    end

    def btn_create_category
      browser.input(class: 'btn_create_category')
    end

    def btn_update_category
      browser.input(class: 'btn_update_category')
    end

    def new_category_with(category)
      div_new_category = browser.div(class: 'template_new_category')
      div_new_category.text_field(id: 'category_name').set(category[:name])
      div_new_category.text_field(id: 'category_description').set(category[:description])
      btn_create_category.click
    end

    def edit_category_with(category)
      div_edit_category = browser.div(class: 'template_edit_category')
      div_edit_category.text_field(id: 'category_name').set(category[:name])
      div_edit_category.text_field(id: 'category_description').set(category[:description])
      btn_update_category.click
    end

    def link_new_post
      browser.link(class: 'link_new_post')
    end

    def link_edit_post
      browser.link(class: 'link_edit_post')
    end

    def btn_new_post
      browser.input(class: 'btn_new_post')
    end

    def form_new_post
      browser.form(class: 'form_new_post')
    end

    def new_post_with(post)
      form_new_post.select_list(id: 'post_point_id').select('编程语言')
      form_new_post.select_list(id: 'post_category_id').select('Ruby')
      form_new_post.select_list(id: 'post_source').select('原创或翻译')

      form_new_post.text_field(id: 'post_title').set(post[:title])
      form_new_post.text_field(id: 'post_tags').set(post[:tags])
      browser.execute_script("CKEDITOR.instances.post_content.setData('"+post[:content]+"')")

      btn_new_post.click
    end
  end
end
