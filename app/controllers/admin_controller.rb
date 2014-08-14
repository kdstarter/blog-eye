class AdminController < ApplicationController
  layout 'admin/home'
  include AdminHelper
  before_filter :authenticate_user!, :load_categories
  
  def load_categories
    @categories = current_user.categories
  end
end
