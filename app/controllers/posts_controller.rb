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
            if @post.likes.where(user_id: current_user.id).exists?
              @post.likes.find_by(user_id: current_user.id).destroy
            else
              @post.likes.create(user_id: current_user.id)
            end
           respond_to do |format|
            format.js
           end
    end



    private
    def post_params
        params.require(:post).permit(:body, :image, :status)
    end
end
