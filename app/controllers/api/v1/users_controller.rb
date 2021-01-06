class Api::V1::UsersController < ApplicationController


    def create
        user = User.new(user_params)
        token = encode_token(user.id)
        if user.save
            render json: {user: UserSerializer.new(user), token: token}, status: 200
        else
            render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.permit(:username, :password)
    end

end
