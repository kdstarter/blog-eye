
class Frontend::CategoriesController < BloggerController

  def show
    @category = Category.find(params[:id])
    @posts = @posts.where(category: @category)
    @posts = @posts.page(params[:page])
  end
  
end
