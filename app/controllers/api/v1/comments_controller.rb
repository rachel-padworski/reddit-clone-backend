class Api::V1::CommentsController < ApplicationController

    before_action :set_user

    def index
        comments = @user.comments
        render json: comments
    end

    def create
        comment = @user.comments.new(comment_params)
        if comment.save
            render json: comment, status: 200
            # render json: 
        else
            render json: {errors: comment.errors.full_messages}, status: :unprocessible_entity
        end
    end

     # if using /api/v1/comments/1 (or any comment id)
    def show
        comment = @user.coments.find_by(id: params[:id])
        render json: comment
    end

    def destroy
        comment = @user.comments.find_by(id: params[:id])
        comment.destroy
    end

    private

    # setting an instance variable to find the account based on the user_id. Comments belong to a user, so we need to find a comment associated with a specific user_id.
    def set_user
        @user = User.find(params[:user_id])
    end

    def comment_params
        params.require(:comment).permit(:content, :user_id, :comment_id)
    end


end
