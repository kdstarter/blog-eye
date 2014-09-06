
class Admin::MessagesController < AdminController

  def index
    @messages = @messages.page(params[:page]).per(15)
  end

end
