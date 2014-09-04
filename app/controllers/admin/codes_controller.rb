
class Admin::CodesController < AdminController

  def index
    @codes = current_user.codes
    @codes = @codes.page(params[:page])
  end

  def show
    @code = Code.find(params[:id])
  end

  def new
    @code = Code.new
  end

  def create
    @code = Code.new(code_params)
    @code.user = current_user
    
    if @code.save
      flash[:notice] = '你已经成功收藏了代码。'
      redirect_to admin_code_path(@code)
    else
      flash[:error] = '收藏代码失败，请注意以下提示！'
      render action: :new
    end
  end

  def edit
    @code = Code.find(params[:id])
  end

  def update
    @code = Code.find(params[:id])

    if @code.update_attributes(code_params)
      flash[:notice] = '你已经成功更新了收藏的代码。'
      redirect_to action: :show
    else
      flash[:error] = '修改代码失败，请注意以下提示！'
      render action: :edit
    end
  end

  def destroy
    @code = Code.find(params[:id])
    @code.destroy

    if @code.persisted?
      flash[:error] = '因为以下原因，删除代码失败。'
      render action: :show
    else
      flash[:notice] = '你已经成功删除了该代码。'
      redirect_to admin_codes_path
    end
  end

  private
  def code_params
    params.require(:code).permit(:user_id, :language_id, :category_id, :source, :title, :content, :tags)
  end
end
