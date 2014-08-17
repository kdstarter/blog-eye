class Admin::RepliesController < AdminController

  def index
    @posts = current_user.posts
    @replies = Reply.where(post_id: @posts.pluck(:id))

    @replies = @replies.page(params[:page])
  end

end
