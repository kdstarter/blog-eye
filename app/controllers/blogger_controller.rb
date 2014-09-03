
class BloggerController < FrontendController

  layout 'frontend/blogger'

  before_action :load_blogger, :load_posts

  def title
    "#{@blogger.signature} - #{@blogger.whose_blogger}"
  end

  protected
  def load_blogger
    @blogger = User.find(params[:uid])
  end

  def load_posts
    @categories = @blogger.categories
    @posts = @blogger.posts
  end
end
