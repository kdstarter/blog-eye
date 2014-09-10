#
# Main frontend controller class
#
class FrontendController < ApplicationController
  include ApplicationHelper
  include FrontendHelper

  layout 'frontend/home'

  before_action :keep_redirect_url
  before_action :load_messages, if: Proc.new { current_user.present? }

  def title
    "#{site_intro}首页"
  end

  protected
  def load_messages
    @messages = current_user.messages
  end

  def keep_redirect_url
    session[:redirect_url] = url_for
  end
end
