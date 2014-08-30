
module Features
  module SessionHelpers
    def sign_up_with(user)
      visit new_user_registration_path
      fill_in 'user_uid', with: user.uid
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      fill_in 'user_password_confirmation', with: user.password_confirmation
      click_button 'sign_up_btn'
    end

    def sign_in_with_login(user)
      create(:valid_register_user)

      visit new_user_session_path
      fill_in 'user_login', with: user.uid || user.email
      fill_in 'user_password', with: user.password
      click_button 'sign_in_btn'
    end
  end
end
