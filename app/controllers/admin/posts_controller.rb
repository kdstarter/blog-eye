class Admin::PostsController < AdminController

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end
  
end
