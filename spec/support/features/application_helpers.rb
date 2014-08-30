
module Features
  module ApplicationHelpers
    def browser
      @browser ||= Watir::Browser.new :firefox
    end

    def link_sign_in
      browser.a(id: 'link_sign_in')
    end

    def sign_in_with(user)
      link_sign_in.click
      browser.text_field(id: 'user_login').set(user[:uid] || user[:email])
      browser.text_field(id: 'user_password').set(user[:password])
      btn_sign_in.click
    end
  end
end