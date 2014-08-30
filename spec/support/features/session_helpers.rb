
module Features
  module SessionHelpers
    def browser
      @browser ||= Watir::Browser.new :firefox
    end

    def sign_out_link
      browser.a(id: 'sign_out_link')
    end

    def sign_up_link
      browser.a(id: 'sign_up_link')
    end

    def sign_up_btn
      browser.input(id: 'sign_up_btn')
    end

    def sign_in_link
      browser.a(id: 'sign_in_link')
    end

    def sign_in_btn
      browser.input(id: 'sign_in_btn')
    end

    def sign_out
      sign_out_link.click
    end

    def sign_up_with(user)
      sign_up_link.click
      browser.text_field(id: 'user_uid').set(user[:uid])
      browser.text_field(id: 'user_email').set(user[:email])
      browser.text_field(id: 'user_password').set(user[:password])
      browser.text_field(id: 'user_password_confirmation').set(user[:password_confirmation])
      sign_up_btn.click
    end

    def sign_in_with(user)
      sign_in_link.click
      browser.text_field(id: 'user_login').set(user[:uid] || user[:email])
      browser.text_field(id: 'user_password').set(user[:password])
      sign_in_btn.click
    end
  end
end
