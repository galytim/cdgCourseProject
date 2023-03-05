class LikesController < ApplicationController
before_action :find_post
  def create
    if !liked?
        @post.likes.create(user_id: current_user.id)
    else
        @post.likes.find_by(user_id: current_user.id).destroy
    redirect_to post_path(@post)
  end
  end

private
  def liked?
    like = Like.where(user_id: current_user.id, post_id: @post.id).exists?
  end


  def find_post
    @post = Post.find(params[:post_id])
  end
end