class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    if current_user && current_user.admin?
      @topic = Topic.new
    end
  end

  def dashboard
    @users = User.all
    @news = Topic.get_news
  end

end
