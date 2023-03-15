class ProfilesController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end
  def feed
    @posts = Post.where("user_id IN (?) OR user_id = ?", current_user.following_ids, current_user.id)
  end
  
  def follow
    @user = User.find(params[:id])
    if current_user.following?(@user)
        current_user.unfollow(@user)
    else
        current_user.send_follow_request_to(@user)
        @user.accept_follow_request_of(current_user)
    end
    respond_to :js
end



end