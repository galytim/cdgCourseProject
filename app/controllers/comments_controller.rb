class CommentsController < ApplicationController


    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(comment_params.merge(user_id: current_user.id))
      if @comment.save
        redirect_to post_path(@post)
      else
        flash[:notice] = "you can't create comments without text"
        redirect_to post_path(@post)
      end

    end

    def destroy
      @comment = Comment.find(params[:id])
      if current_user.comments.exists?(@comment.id)
        Comment.delete(@comment.id)
      else
        flash[:notice] = "you can't delete comments that aren't yours"
      end
      redirect_to post_path(@comment.post), status: 303
    end

    private
      def comment_params
        params.require(:comment).permit(:commenter, :body)
      end
end
