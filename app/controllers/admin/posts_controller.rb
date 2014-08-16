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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      flash[:notice] = '你已经成功修改了文章。'
      redirect_to action: 'show'
    else
      flash[:error] = '请注意以下提示，再保存文章。'
      render action: 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    if @post.persisted?
      flash[:error] = '因为以下原因，删除文章失败。'
      render action: :show
    else
      flash[:notice] = '你已经成功删除了文章。'
      redirect_to admin_root_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :point_id, :category_id, :source, :title, :content, :tags)
  end

end
