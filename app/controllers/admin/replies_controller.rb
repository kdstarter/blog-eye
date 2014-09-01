class Admin::RepliesController < AdminController

  def index
    @posts = current_user.posts
    @replies = Reply.where(post_id: @posts.pluck(:id))

    @replies = @replies.page(params[:page])
  end

  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy

    flash[:notice] = '你已经成功删除了该评论。'
    js_reload_without_params
  end

end
