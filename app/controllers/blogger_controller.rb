
class BloggerController < FrontendController

  layout 'frontend/blogger'

  before_action :load_blogger, :load_posts

  protected
  def load_blogger
    @blogger = User.find(params[:user_id])
  end

  def load_posts
    @categories = @blogger.categories
    @posts = @blogger.posts
  end
end
