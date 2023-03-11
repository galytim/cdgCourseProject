class ProfilesController < ApplicationController
  before_action :find_user!
  def index
    @users = User.all
  end
  def show
    @user
  end

  
  def follow
    if current_user.following?(@user)
        current_user.unfollow(@user)
    else
        current_user.send_follow_request_to(@user)
        @user.accept_follow_request_of(current_user)
    end
    respond_to :js
end



  private
  def find_user!
      @user = User.find(params[:id])
  end
end