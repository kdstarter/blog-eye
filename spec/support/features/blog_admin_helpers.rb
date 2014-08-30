
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

    def btn_new_category
      browser.input(class: 'btn_new_category')
    end

    def new_category_with(category)
      browser.text_field(id: 'category_name').set(category[:name])
      browser.text_field(id: 'category_description').set(category[:description])
      btn_new_category.click
    end

    def link_new_post
      browser.link(class: 'link_new_post')
    end

    def form_new_post
      browser.form(class: 'form_new_post')
    end
  end
end
