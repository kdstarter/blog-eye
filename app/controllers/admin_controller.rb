class AdminController < ApplicationController
  include ApplicationHelper
  include AdminHelper

  layout 'admin/home'
  before_filter :authenticate_user!, :load_categories
  
  def load_categories
    @categories = current_user.categories
  end
end
