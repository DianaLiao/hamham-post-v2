class MessagesController < ApplicationController


  def create
    @message = Message.new(msg_params)
    if(@message.valid?)
      @message.save
      redirect_to board_path(msg_params[:board_id], anchor:"newest")
    else
      flash[:errors] = @message.errors.full_messages
      redirect_to board_path(msg_params[:board_id])
    end

  end

  private

  def msg_params
    params.require(:message).permit(:content, :user_id, :board_id)
  end

end
