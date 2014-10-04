# encoding: utf-8
class Admin::HomeController < AdminController
  before_action :load_user
  
  def index
    @posts = @user.posts
    @replies = Reply.where(post_id: @posts.pluck(:id))

    @posts = @posts.page(params[:page])
    @replies = @replies.page(params[:page_reply]).includes(:post)
  end

  def profile

  end

  def update_profile
    if @user.update_attributes(user_params)
      flash[:notice] = '成功更新个人资料。'
      redirect_to admin_profile_path
    else
      flash[:error] = '未能成功更新个人资料，请查看以下错误。'
      render :profile
    end
  end

  private
  def load_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:avatar, :name, :is_email_public, :signature, :city_name, 
      :company, :github, :homepage, :description)
  end

end
