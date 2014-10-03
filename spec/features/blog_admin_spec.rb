require 'rails_helper'
require 'watir-webdriver'
require 'rspec/example_steps'

context 'Blogger regular operation flows', type: :feature do

  before :all do
    browser.goto Settings.test.site_url
  end

  after :all do
    sleep 3
    browser.close
  end

  Steps 'Blogger manage blogosphere' do
    Given 'I am going to my management page' do
      valid_user = attributes_for(:valid_random_user)
      sign_up_with valid_user

      expect(btn_sign_up.exists?).to be(false)
    end

    When 'I am on my management page' do
      link_admin_home.click

      expect(link_admin_home.exists?).to be(true)
    end

    Then 'Go to admin categories page' do
      link_admin_categories.click

      expect(link_new_category.exists?).to be(true)
    end

    Then 'Click to add new category' do
      link_new_category.click
      valid_category = attributes_for(:valid_random_category)
      link_category = browser.link(class: "category_#{valid_category[:name]}")

      expect(link_category.exists?).to be(false)
      new_category_with valid_category
      expect(link_category.exists?).to be(true)
    end

    Then 'Edit last category info' do
      link_edit_category.click
      expect(btn_update_category.exists?).to be(true)
    end

    Then 'Update last category info' do
      valid_category = attributes_for(:valid_category)

      edit_category_with valid_category
      expect(btn_update_category.exists?).to be(false)
    end

    Then 'Go to new post page' do
      link_new_post.click

      expect(form_new_post.exists?).to be(true)
    end

    Then 'Click to add new post' do
      valid_post = attributes_for(:valid_new_post)

      new_post_with valid_post
      expect(btn_new_post.exists?).to be(false)
      expect(link_edit_post.exists?).to be(true)
    end
  end

end
