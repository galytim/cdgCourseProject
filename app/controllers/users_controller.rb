class UsersController < ApplicationController
  before_action :find_user!
  def index
    @users = User.all
  end
  def show
    @user
  end
  def follow
    @user.followers
  end
  private
   def find_user!
    @user = User.find(params[:id])
end