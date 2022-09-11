class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @groups = current_user.groups
    @start = @user.created_at
    @artist = @user.artist
    @gender = @user.gender
    @area = @user.area
  end
end
