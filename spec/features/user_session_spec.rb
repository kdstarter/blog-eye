
require 'rails_helper'

feature 'User sign up' do
  scenario 'with invalid uid' do
    invalid_user = build(:invalid_uid_user)
    sign_up_with invalid_user

    expect(page).to have_button('sign_up_btn')
  end

  scenario 'with invalid email' do
    invalid_user = build(:invalid_email_user)
    sign_up_with invalid_user

    expect(page).to have_button('sign_up_btn')
  end

  scenario 'with too short password' do
    invalid_user = build(:invalid_password_user)
    sign_up_with invalid_user

    expect(page).to have_button('sign_up_btn')
  end

  scenario 'with password confirmation failed' do
    invalid_user = build(:invalid_repassword_user)
    sign_up_with invalid_user

    expect(page).to have_button('sign_up_btn')
  end

  scenario 'with valid info' do
    valid_user = build(:valid_register_user)
    sign_up_with valid_user

    expect(page).not_to have_button('sign_up_btn')
  end
end


feature 'User sign in' do
  scenario 'with invalid uid' do
    invalid_user = build(:invalid_uid_login_user)
    sign_in_with_login invalid_user

    expect(page).to have_button('sign_in_btn')
  end

  scenario 'with invalid email' do
    invalid_user = build(:invalid_email_login_user)
    sign_in_with_login invalid_user

    expect(page).to have_button('sign_in_btn')
  end

  scenario 'with invalid password' do
    invalid_user = build(:invalid_password_login_user)
    sign_in_with_login invalid_user

    expect(page).to have_button('sign_in_btn')
  end

  scenario 'with valid uid' do
    valid_user = build(:valid_uid_login_user)
    sign_in_with_login valid_user

    expect(page).not_to have_button('sign_in_btn')
  end

  scenario 'with valid email' do
    valid_user = build(:valid_email_login_user)
    sign_in_with_login valid_user

    expect(page).not_to have_button('sign_in_btn')
  end
end

