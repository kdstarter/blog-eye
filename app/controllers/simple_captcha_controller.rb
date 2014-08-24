class SimpleCaptchaController < ApplicationController

  def update_captcha
    flash.delete :captcha_error
    render layout: false
  end

end
