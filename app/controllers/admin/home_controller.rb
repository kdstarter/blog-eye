class Admin::HomeController < AdminController
  
  def index
    @posts = current_user.posts
  end

  def profile
    @user = current_user
  end

  def update_profile
    @user = current_user

    if @user.update_attributes(user_params)
      flash[:notice] = '成功更新个人资料。'
      redirect_to admin_profile_path
    else
      flash[:error] = '未能成功更新个人资料，请查看以下错误。'
      render action: :profile
    end
  end

  private
  def user_params
    params.require(:user).permit(:avatar, :name, :is_email_public, :signature, :city_name, 
      :company, :github, :homepage, :description)
  end

end
