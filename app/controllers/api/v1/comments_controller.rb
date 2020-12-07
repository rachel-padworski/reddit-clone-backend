class Api::V1::CommentsController < ApplicationController
    # confused before comments belong_to :user and belong_to :post
    # also take a look at the routes.

    # before_action :set_user 
    # The user needs to be found before using any of these controls. 
    # should the post be found before using any of these controls too?
    before_action :set_post

    def index
        # i want to let users view all comments on a post
        # comments = @user.comments ....this would allow us to view all comments by a user.
        # if @post
        #     comments = @post.comments
        # else
            comments = Comment.all
        render json: comments
    end

    def create
        # comment = @user.comments.new(comment_params) ...do i need this to create a new comment?
        # it would allow us to find the user's id before creating the comment...but we need the post id so we know where it's posting.
        comment = @post.comments.new(comment_params)
        if comment.save
            render json: comment, status: 200
        else
            render json: {errors: comment.errors.full_messages}, status: :unprocessible_entity
        end
    end

     # if using /api/v1/comments/1 (or any comment id)
    def show
        comment = @post.comments.find_by(id: params[:id])
        render json: comment
    end

    def destroy
        comment = @post.comments.find_by(id: params[:id])
        comment.destroy
    end

    private

    # setting an instance variable to find the account based on the user_id. Comments belong to a user, so we need to find a comment associated with a specific user_id.
    # def set_user
    #     @user = User.find(params[:user_id])
    # end

    def set_post
        @post = Post.find(params[:post_id])
    end

    def comment_params
        params.require(:comment).permit(:content, :user_id, :comment_id)
    end


end
