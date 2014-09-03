#
# Main frontend controller class
#
class FrontendController < ApplicationController
  include ApplicationHelper
  include FrontendHelper

  layout 'frontend/home'

  def title
    "博客信息技术分享平台首页"
  end

end
