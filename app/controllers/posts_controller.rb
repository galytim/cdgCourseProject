class PostsController < ApplicationController
  
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to @post
        else 
            render :new, status: :unprocessable_entity
        end 
    
    end

    def edit
        @post = current_user.posts.find(params[:id])
    end

    def update
        @post = current_user.posts.find(params[:id])
        if  @post.update(post_params)
            redirect_to @post
        else 
            render :edit, status: :unprocessable_entity
        end 
    end



    def destroy
        if  @post = current_user.posts.find(params[:id])
            @post.destroy
        else
            flash[:notice] = "you can't delete posts that aren't yours"
        end
        redirect_to root_path, status: :see_other
    end    



    def like
        @post = Post.find(params[:id])
        if !@post.liked_users.exists?(current_user.id)
            @post.liked_users.push(current_user)
        else
          @post.liked_users.delete(current_user)
        
        end
        respond_to :js
    end



    private
    def post_params
        params.require(:post).permit(:body, :image, :status, :liked_users)
    end
end
