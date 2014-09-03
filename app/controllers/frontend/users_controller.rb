# encoding: utf-8
class Frontend::UsersController < BloggerController

  # after_action :update_visits, only: [:show]

  # 访问别人的博客主页
  def show
    @posts = @posts.page(params[:page]).per(5)
  end

  def profile

  end

  protected
  # override super method
  def load_blogger
    @blogger = User.find(params[:uid])
  end

  def update_visits
    if @blogger != current_user
      @blogger.update_attributes(visits: @blogger.visits + 1)
    end
  end
end
