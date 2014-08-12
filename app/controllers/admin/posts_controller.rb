class Admin::PostsController < AdminController

  def show
    @categories = Category.where(user: @current_user)
    @post = Post.find(params[:id])
  end
  
end
