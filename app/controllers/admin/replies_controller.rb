class Admin::RepliesController < AdminController

  def index
    @posts = current_user.posts
    @replies = Reply.with_deleted.where(post_id: @posts.pluck(:id))

    @replies = @replies.page(params[:page_reply])
  end

  def destroy
    @reply = Reply.find(params[:id])
    @reply.really_destroy!

    flash[:notice] = '你已经成功删除了该评论。'
    js_reload_without_params
  end

  def hide
    @reply = Reply.find(params[:id])
    @reply.destroy

    flash[:notice] = '你已经成功隐藏了该评论。'
    js_reload_without_params
  end

  def restore
    @reply = Reply.with_deleted.find(params[:id])
    Reply.restore(@reply.id)

    flash[:notice] = '你已经成功恢复了该评论。'
    js_reload_without_params
  end
end
