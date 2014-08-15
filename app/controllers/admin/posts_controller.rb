class Admin::PostsController < AdminController

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    
    if @post.save
      redirect_to admin_post_path(@post)
    else
      render action: "new"
    end
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :point_id, :category_id, :source, :title, :content, :tags)
  end

end
