
class Frontend::PostsController < BloggerController

  def show
    @post = @posts.find(params[:id])
    @reply = Reply.new(post_id: @post.id)
    @replies = @post.replies.order('created_at asc')
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
