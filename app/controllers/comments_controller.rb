class CommentsController < ApplicationController
  before_action :find_post

    def create
      @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
      redirect_to post_path(@post)
    end

    def destroy
      
      if @comment = current_user.comments.find(params[:id])
        @comment.destroy
      else
        flash[:notice] = "you can't delete comments that aren't yours"
      end
      redirect_to post_path(@post), status: 303
    end

    private
      def find_post
        @post = Post.find(params[:post_id])
      end
      def comment_params
        params.require(:comment).permit(:commenter, :body, :status)
      end
end
