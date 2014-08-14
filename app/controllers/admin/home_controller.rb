class Admin::HomeController < AdminController
  
  def index
    @posts = current_user.posts
  end
  
end
