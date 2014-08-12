class Admin::HomeController < AdminController
  
  def index
    @categories = Category.where(user: @current_user)
    @posts = Post.where(user: @current_user)

  end
  
end
