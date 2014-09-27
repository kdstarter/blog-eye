class Frontend::BlogsController < FrontendController

  def index
    @blogs = Blog.visible.order("created_at desc").page(params[:page]).per(8)
  end

  def show
    @blog = Blog.visible.find(params[:id])
  end
end
