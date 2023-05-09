class FollowsController < ApplicationController
  protect_from_forgery except: [:follow]
  before_action :find_user
  def follow
     current_user.following?(@user) ? current_user.unfollow(@user) : current_user.follow(@user)
    respond_to :js
end

private
  def find_user
    @user = User.find(params[:id])
  end
end