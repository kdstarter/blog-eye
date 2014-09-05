
class Frontend::CodesController < BloggerController
  def index
    @codes = @blogger.codes.page(params[:page_code])
  end

  def show
    @code = Code.find(params[:id])
  end
end
