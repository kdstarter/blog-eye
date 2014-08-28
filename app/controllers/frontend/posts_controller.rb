
class Frontend::PostsController < BloggerController

  def show
    @post = @posts.find(params[:id])
  end

  protected
  # override super method
  def load_blogger
    user_id = params[:user_id]
    if user_id.present?
      @blogger = User.find(user_id)
    else
      post_id = params[:id]
      @post = Post.find(post_id)
      @blogger = @post.user
    end
  end

end
