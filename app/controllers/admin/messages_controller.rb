
class Admin::MessagesController < AdminController

  def index
    @messages = @messages.order('created_at desc').page(params[:page]).per(15)
  end

  def show
    @message = Message.find(params[:id])

    case @message.target_type
    when 'Reply'
      @reply = Reply.find(@message.target_id)
      @post = @reply.post
      redirect_to "#{frontend_post_path(@post)}#reply#{@reply.id}"
    else

    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    if @message.persisted?
      flash[:error] = '因为以下原因，删除消息失败。'
      render :back
    else
      flash[:notice] = '你已经成功删除了该消息。'
      redirect_to admin_messages_path
    end
  end
end
