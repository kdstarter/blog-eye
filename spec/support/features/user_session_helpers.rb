
module Features
  module UserSessionHelpers
    def link_sign_out
      browser.a(id: 'link_sign_out')
    end

    def link_sign_up
      browser.a(id: 'link_sign_up')
    end

    def btn_sign_up
      browser.input(id: 'btn_sign_up')
    end

    def btn_sign_in
      browser.input(id: 'btn_sign_in')
    end

    def sign_out
      link_sign_out.click
    end

    def sign_up_with(user)
      link_sign_up.click
      browser.text_field(id: 'user_uid').set(user[:uid])
      browser.text_field(id: 'user_email').set(user[:email])
      browser.text_field(id: 'user_password').set(user[:password])
      browser.text_field(id: 'user_password_confirmation').set(user[:password_confirmation])
      btn_sign_up.click
    end
  end
end
