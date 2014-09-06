
class Frontend::HomeController < FrontendController

  def index
    @codes = Code.order("created_at desc").limit(10)
    @posts = Post.order("likes desc, created_at desc").limit(10)
  end

end
