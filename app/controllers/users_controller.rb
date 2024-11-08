class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end

  def compatibility_index
    @user = User.find(params[:id])
    @compatible_users = @user.compatible_users
  end
  
end


