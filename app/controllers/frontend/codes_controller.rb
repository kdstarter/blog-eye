
class Frontend::CodesController < BloggerController
  def index
    @codes = @blogger.codes.page(params[:page_code]).per(10)
  end
end
