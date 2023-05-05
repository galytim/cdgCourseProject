class ProfilesController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user  = User.find(params[:id])
  end

  def feed
    @posts = Post.where("user_id IN (?) OR user_id = ?", current_user.following_ids, current_user.id)
  end

end