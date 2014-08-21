class Admin::CategoriesController < AdminController

  def index
    
  end

  def show
    @category = Category.find(params[:id])
    @posts = current_user.posts.where(category: @category)
    @posts = @posts.page(params[:page])
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id

    respond_to do |format|
      if @category.save
        format.json{ head :no_content }
      else
        format.json { render json:  draw_errors_message(@category), status: 403}
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    category_name = @category.name
    @category.destroy

    if @category.persisted?
      js_alert("删除分类#{category_name}失败！")
    else
      flash[:notice] = "成功删除分类#{category_name}。"
      js_reload
    end
  end

  private
  def category_params
    params.require(:category).permit(:user_id, :name, :description)
  end

end
