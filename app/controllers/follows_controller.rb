class FollowsController < ApplicationController
    before_action :set_user
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
    def set_user
        @user = User.find(params[:id])
    end
    def follow_params
        params.permit(id)
    end
end