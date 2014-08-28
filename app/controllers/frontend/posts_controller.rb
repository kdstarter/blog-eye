
class Frontend::PostsController < BloggerController

  def show
    @post = @posts.find(params[:id])
  end

end
