#
# Main frontend controller class
#
class FrontendController < ApplicationController
  include ApplicationHelper
  include FrontendHelper

  layout 'frontend/home'

  before_action :keep_redirect_url

  def title
    site_intro
  end

  protected
  def keep_redirect_url
    session[:redirect_url] = url_for
  end
end
