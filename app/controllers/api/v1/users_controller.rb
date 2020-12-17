class Api::V1::UsersController < ApplicationController


    def create
        user = Usern.new(user_params)
        if user.save
            session[:user_id] = user.id
            render json: user, status: 200
        else
            render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
    end

    private

    def user_params
        params.permit(:username, :password)
    end

end
