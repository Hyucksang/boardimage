class PostsController < ApplicationController
    def index
        @posts = Post.all.order('created_at DESC')
    end
    
    def new
        @post = Post.new
    end

    def edit
        @post = Post.find(params[:id])
    end
    
    def show
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        redirect_to @post
    end
    
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to root_path
    end
    
    def create
        @post = Post.new(post_params)
        @post.save
        redirect_to @post
    end
    
    
    private
    def post_params
        params.require(:post).permit(:title,:content)
    end
end
