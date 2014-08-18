# encoding: utf-8
class Frontend::UsersController < FrontendController

  layout 'frontend/blog_home'

  before_action :load_blogger

  def index

  end

  # 访问别人的博客主页
  def show
    @posts = @posts.page(params[:page]).per(4)
  end

  private
  def load_blogger
    @blogger = User.find(params[:id])
    @posts = @blogger.posts
    @categories = @blogger.categories
  end
end
