
require 'rails_helper'
require 'watir-webdriver'
require 'rspec/example_steps'

context 'User session flows', type: :feature do

  before :all do
    browser.goto "http://localhost:3000"
  end

  after :all do
    sleep 3
    browser.close
  end

  Steps 'User sign up and sign in' do
    Given 'I am on portal page' do
      expect(sign_up_link.exists?).to be(true)
      expect(sign_in_link.exists?).to be(true)
    end

    When 'sign up with invalid uid' do
      invalid_user = attributes_for(:invalid_uid_user)
      sign_up_with invalid_user
      
      expect(sign_up_btn.exists?).to be(true)
    end

    Then 'sign up with invalid email' do
      invalid_user = attributes_for(:invalid_email_user)
      sign_up_with invalid_user

      expect(sign_up_btn.exists?).to be(true)
    end

    Then 'sign up with too short password' do
      invalid_user = attributes_for(:invalid_password_user)
      sign_up_with invalid_user

      expect(sign_up_btn.exists?).to be(true)
    end

    Then 'sign up with password confirmation failed' do
      invalid_user = attributes_for(:invalid_repassword_user)
      sign_up_with invalid_user

      expect(sign_up_btn.exists?).to be(true)
    end

    Then 'sign up with valid info' do
      valid_user = attributes_for(:valid_register_user)
      sign_up_with valid_user

      expect(sign_up_btn.exists?).to be(false)
    end

    include_steps 'sign_out_step'
    include_steps 'sign_in_step'
  end

  shared_steps 'sign_out_step' do
    Then 'sign out current user' do
      sign_out

      expect(sign_out_link.exists?).to be(false)      
    end
  end

  shared_steps 'sign_in_step' do
    Then 'sign in with invalid uid' do
      invalid_user = attributes_for(:invalid_uid_login_user)
      sign_in_with invalid_user

      expect(sign_in_btn.exists?).to be(true)
    end

    Then 'sign in with invalid email' do
      invalid_user = attributes_for(:invalid_email_login_user)
      sign_in_with invalid_user

      expect(sign_in_btn.exists?).to be(true)
    end

    Then 'sign in with invalid password' do
      invalid_user = attributes_for(:invalid_password_login_user)
      sign_in_with invalid_user

      expect(sign_in_btn.exists?).to be(true)
    end

    Then 'sign in with valid uid' do
      valid_user = attributes_for(:valid_uid_login_user)
      sign_in_with valid_user

      expect(sign_in_btn.exists?).to be(false)
    end

    include_steps 'sign_out_step'

    Then 'sign in with valid email' do
      valid_user = attributes_for(:valid_email_login_user)
      sign_in_with valid_user

      expect(page).not_to have_button('sign_in_btn')
    end
  end
end

