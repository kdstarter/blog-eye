
class Frontend::HomeController < FrontendController

  def index
    @users = User.limit(5).order("created_at asc")
    @posts = Post.order("likes desc, created_at desc").limit(4)
    @replies = Reply.order("created_at desc").limit(5)
  end

end
