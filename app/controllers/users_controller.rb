class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @name = current_user.name
    @posts = current_user.posts
  end
end
