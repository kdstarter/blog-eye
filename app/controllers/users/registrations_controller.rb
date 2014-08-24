# encoding: utf-8
class Users::RegistrationsController < Devise::RegistrationsController

  def create
    if Settings.user.skip_captcha || simple_captcha_valid?
      super
    else
      build_resource(sign_up_params)
      clean_up_passwords(resource)
      flash.now[:alert] = "验证码不匹配，请重新输入"
      flash.delete :captcha_error
      render :new
    end
  end

  def is_uid_exist
    user = User.new(uid: params[:uid])

    respond_to do |format|
      if !user.valid? && user.errors[:uid].present?
        format.json { render json: { message: "用户名 #{user.uid} #{user.errors[:uid].first}" }, status: 403}
      else
        format.json{ render json: { message: "用户名 #{user.uid} 可以使用" } }
      end
    end
  end

  protected
  # The path used after sign up. You need to overwrite this method
  # in your own RegistrationsController.
  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
  end

  def after_update_path_for(resource)
    case resource
    when :user, User
      resource.teacher? ? another_path : root_path
    else
      super
    end
  end

end
