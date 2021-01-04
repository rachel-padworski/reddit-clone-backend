class Api::V1::CommentsController < ApplicationController
    # confused before comments belong_to :user and belong_to :post
    # also take a look at the routes.

    # before_action :set_user 
    # The user needs to be found before using any of these controls. 
    # should the post be found before using any of these controls too?
    # before_action :set_post

    def index
        comments = Comment.all
        render json: comments, status: 200
    end

    def create
        # comment = @user.comments.new(comment_params) ...do i need this to create a new comment?
        # it would allow us to find the user's id before creating the comment...but we need the post id so we know where it's posting.
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment, status: 200
            # should this render json: comment or post?Comment is nested under post.
        else
            render json: {errors: comment.errors.full_messages}, status: :unprocessable_entity
        end
    end

     # if using /api/v1/comments/1 (or any comment id)
    def show
        comment = Comment.find_by(id: params[:id])
        render json: comment
    end

    def update
        binding.pry
        comment = Comment.find_by(id: params[:id])
        if comment.update(content: params[:content])
            render json: comment, status: 200
        else
            render json: {error: 'Could not update'}
        end
    end

    def destroy
        comment = Comment.find(params["id"])
        post = Post.find(comment.post_id)
        comment.destroy
        render json: post
        # comment = Comment.find(params[:id])
        # post = Post.find(params[:id]) 
        # if comment.destroy
        #     render json: post, status: 200
        # else
        #     render json: {error: 'Could not delete.'}
        # end
    end

    private
    
        def comment_params
            params.require(:comment).permit(:content, :user_id, :post_id)
        end

    # setting an instance variable to find the post based on the user_id. Comments belong to a user, so we need to find a comment associated with a specific user_id.
    # def set_user
    #     @user = User.find(params[:user_id])
    # end

    # def set_post
    #     @post = Post.find(params[:id])
    # end

    # def set_comment
    #     @comment = Comment.find_by(id: params[:id])
    # end


end
