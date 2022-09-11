class MessagesController < ApplicationController
  def create
    Message.create(message_params)
    redirect_to root_path
  end
  
  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
