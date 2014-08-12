class AdminController < ApplicationController
  layout 'admin/home'
  include AdminHelper
  before_filter :authenticate_user!, :load_current_user

  def load_current_user
    @current_user = current_user
  end
  
end
