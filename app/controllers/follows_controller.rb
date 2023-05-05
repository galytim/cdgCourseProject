class FollowsController < ApplicationController
  before_action :find_user
  def follow
    if current_user.following?(@user)
        current_user.followerable_relationships.where(followable_id: @user.id).destroy_all
    else
        current_user.send_follow_request_to(@user)
        @user.accept_follow_request_of(current_user)
    end
    respond_to :js
end
private
  def find_user
    @user = User.find(params[:id])
  end
end