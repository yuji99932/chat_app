class HomeController < ApplicationController
  def index
    @groups = Group.all.order(created_at: :desc)
  end
end
