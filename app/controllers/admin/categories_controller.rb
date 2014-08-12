class Admin::CategoriesController < AdminController

  def show
    @categories = Category.where(user: @current_user)
    @category = Category.find(params[:id])

    @posts = Post.where(user: @current_user, category: @category)
  end

end
