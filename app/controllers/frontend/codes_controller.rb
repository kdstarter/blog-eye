
class Frontend::CodesController < BloggerController
  def index
    @codes = @blogger.codes.page(params[:page_code]).per(15)
  end

  def show
    @code = Code.find(params[:id])
  end
end
