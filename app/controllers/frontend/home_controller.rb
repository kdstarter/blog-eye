
class Frontend::HomeController < FrontendController
  # caches_action :index, cache_path: proc { |c| c.params }, expires_in: 1.minute

  def index
    @codes = Code.limit(10).includes(:user)
    @posts = Post.order("likes desc, created_at desc").limit(10).includes(:user)
  end

  def about_us

  end
end
