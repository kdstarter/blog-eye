require 'rails_helper'
require 'watir-webdriver'
require 'rspec/example_steps'

context 'Blogger regular operation flows', type: :feature do

  before :all do
    browser.goto "http://localhost:3000"
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

    Then 'Go to new post page' do
      link_new_post.click

      expect(form_new_post.exists?).to be(true)
    end
  end

end