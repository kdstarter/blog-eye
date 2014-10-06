class Admin::RepliesController < AdminController
  before_action :load_replies

  def index
    @posts = current_user.posts
    @replies = @replies.where(post_id: @posts.pluck(:id))

    @replies = @replies.page(params[:page_reply])
  end

  def destroy
    @reply = @replies.find(params[:id])
    @reply.really_destroy!

    flash[:notice] = '你已经成功删除了该评论。'
    js_reload_without_params
  end

  def hide
    @reply = @replies.find(params[:id])
    @reply.destroy

    flash[:notice] = '你已经成功隐藏了该评论。'
    js_reload_without_params
  end

  def restore
    @reply = @replies.find(params[:id])
    @reply.restore

    flash[:notice] = '你已经成功恢复了该评论。'
    js_reload_without_params
  end

  protected
  def load_replies
    @replies = current_user.replies.with_deleted
  end
end
