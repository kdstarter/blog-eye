#
# Main frontend controller class
#
class FrontendController < ApplicationController
  include ApplicationHelper
  include FrontendHelper

  layout 'frontend/home'

  before_action :load_messages, if: Proc.new { current_user.present? }
  before_action :keep_redirect_url

  def title
    "#{site_intro}首页"
  end

  def load_messages
    @messages = current_user.messages
  end

  protected
  def keep_redirect_url
    session[:redirect_url] = url_for
  end
end
