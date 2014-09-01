# encoding: utf-8
class Frontend::UsersController < BloggerController

  # 访问别人的博客主页
  def show
    @posts = @posts.page(params[:page]).per(4)
  end

  protected
  # override super method
  def load_blogger
    @blogger = User.find(params[:uid])
  end

end
