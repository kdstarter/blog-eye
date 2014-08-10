class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?


  protected
  # configure devise permitted parameters
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u|
      u.permit(:uid, :email, :password, :password_confirmation, :remember_me) 
    }
    devise_parameter_sanitizer.for(:sign_in) { |u|
      u.permit(:login, :uid, :email, :password, :remember_me) 
    }
    devise_parameter_sanitizer.for(:account_update) { |u|
      u.permit(:uid, :email, :password, :password_confirmation, :current_password)
    }
  end

  # for user devise session
  def after_sign_in_path_for(resource_or_scope)
    admin_root_path
  end
  
  def after_sign_out_path_for(resource_or_scope)
    frontend_user_path(current_user)
  end

end
