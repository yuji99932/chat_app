class GroupsController < ApplicationController
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update]
  def show
    @group = Group.find(params[:id])
    @message = Message.new
    @messages = @group.messages.includes(:user)
  end
  
  def new
    @group = Group.new
  end
  
  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      redirect_to root_path
      flash[:notice] = "グループを作成しました"
    else
      render("groups/new")
    end
  end
  
  def edit
    
  end
  
  def update
    
    if @group.update(group_params)
      redirect_to group_path
      flash[:notice] = "グループを編集しました"
    else
      render("groups/edit")
    end
  end
  
  def destroy
    @group = Group.find(params[:id])
    if @group.destroy
      redirect_to root_path
      flash[:notice] = "グループを削除しました"
    else
      render("groups/destroy")
    end
  end
  
  private
  
  def group_params
    params.require(:group).permit(:name, :introduction, :other).merge(user_id: current_user.id)
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
  def ensure_correct_user
    @group = Group.find(params[:id])
    unless @group.owner_id == current_user.id
      redirect_to root_path
    end
  end
end
