class Api::V1::PostsController < ApplicationController

    def index
       
        posts = Post.all 
        # render json: PostSerializer.new(posts)
        render json: posts 
    end

    def create
        post = Post.new(post_params)
        if post.save
            render json: post, status: 200
        else
            render json: {errors: post.errors.full_messages}, status: :unprocessable_entity
        end
    end

    # if using /api/v1/posts/1 (or any post id)
    def show
        post = Post.find(params[:id])
        render json: post
    end

    def update
        post = Post.find(params[:id])
        if post.update(post_params)
            render json: post, status: 200
        else
            render json: {errors: post.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        post = Post.find(params[:id])
        post.destroy
    end

    private

    def post_params
        # params.require(:post).permit(:title, :content, :image_url, :user_id)
        params.permit(:title, :content, :image_url, :user_id)
    end

end
