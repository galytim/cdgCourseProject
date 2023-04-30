class LikesController < ApplicationController
    before_action :find_post
    def like
        if !@post.liked_users.exists?(current_user.id)
            @post.liked_users.push(current_user)
        else
            @post.liked_users.delete(current_user)
        end
        respond_to :js
    end
private
    def find_post
        @post = Post.find(params[:id])
    end
end
