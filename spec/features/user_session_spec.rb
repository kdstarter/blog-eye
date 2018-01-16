require 'rails_helper'
require 'watir-webdriver'
require 'rspec/example_steps'

context 'User session operation flows', type: :feature, broken: true do

  before :all do
    browser.goto Settings.test.site_url
  end

  after :all do
    sleep 1
    browser.close
  end

  Steps 'User sign up and sign in' do
    Given 'I am on portal page now' do
      expect(link_sign_up.exists?).to be(true)
      expect(link_sign_in.exists?).to be(true)
    end

    When 'sign up with invalid uid' do
      invalid_user = attributes_for(:invalid_uid_user)
      sign_up_with invalid_user
      
      expect(btn_sign_up.exists?).to be(true)
    end

    Then 'sign up with invalid email' do
      invalid_user = attributes_for(:invalid_email_user)
      sign_up_with invalid_user

      expect(btn_sign_up.exists?).to be(true)
    end

    Then 'sign up with too short password' do
      invalid_user = attributes_for(:invalid_password_user)
      sign_up_with invalid_user

      expect(btn_sign_up.exists?).to be(true)
    end

    Then 'sign up with password confirmation failed' do
      invalid_user = attributes_for(:invalid_repassword_user)
      sign_up_with invalid_user

      expect(btn_sign_up.exists?).to be(true)
    end

    Then 'sign up with valid info' do
      valid_user = attributes_for(:valid_user)
      sign_up_with valid_user

      expect(btn_sign_up.exists?).to be(false)
    end

    include_steps 'sign_out_step'
    include_steps 'sign_in_step'
  end

  shared_steps 'sign_out_step' do
    Then 'sign out current user' do
      sign_out

      expect(link_sign_out.exists?).to be(false)      
    end
  end

  shared_steps 'sign_in_step' do
    Then 'sign in with invalid uid' do
      invalid_user = attributes_for(:invalid_uid_login_user)
      sign_in_with invalid_user

      expect(btn_sign_in.exists?).to be(true)
    end

    Then 'sign in with invalid email' do
      invalid_user = attributes_for(:invalid_email_login_user)
      sign_in_with invalid_user

      expect(btn_sign_in.exists?).to be(true)
    end

    Then 'sign in with invalid password' do
      invalid_user = attributes_for(:invalid_password_login_user)
      sign_in_with invalid_user

      expect(btn_sign_in.exists?).to be(true)
    end

    Then 'sign in with valid uid' do
      valid_user = attributes_for(:valid_uid_login_user)
      sign_in_with valid_user

      expect(btn_sign_in.exists?).to be(false)
    end

    include_steps 'sign_out_step'

    Then 'sign in with valid email' do
      valid_user = attributes_for(:valid_email_login_user)
      sign_in_with valid_user

      expect(page).not_to have_button('btn_sign_in')
    end
  end

end

