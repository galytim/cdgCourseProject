class FollowsController < ApplicationController
    before_action :set_user
    def follow
        current_user.send_follow_request_to(@user)
        @user.accept_follow_request_of(current_user)
        redirect_to profile_path(@user)
    end
    def unfollow
        current_user.unfollow(@user)
        redirect_to profile_path(@user)
    end
    private
    def set_user
        @user = User.find(params[:id])
    end
    def follow_params
        params.permit(id)
    end
end