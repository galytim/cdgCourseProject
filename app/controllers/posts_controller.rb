class PostsController < ApplicationController

    def show
        @post = Post.find(params[:id])

    end

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(post_params)

        if @post.save
            redirect_to post_path(@post)
        else 
            render :new
        end 
    end
    

    def edit
        @post = current_user.posts.find(params[:id])
    end

    def update
        @post = current_user.posts.find(params[:id])
        if  @post.update(post_params)
            redirect_to post_path(@post)
        else 
            render :edit
        end 
    end



    def destroy
        if  @post = current_user.posts.find(params[:id])
            @post.destroy
        end
        
        redirect_to feed_path
    end    





    private
    def post_params
        params.require(:post).permit(:body, :image, :status, :liked_users)
    end
end
