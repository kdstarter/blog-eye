class AdminController < ApplicationController
  layout 'admin/home'
  include AdminHelper
  before_filter :authenticate_user!
  
end
