class Api::V1::SessionsController < ApplicationController
  
    def login
      user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        token = encode_token(user.id)
        render json: {user: UserSerializer.new(user), token: token}, status: 200
      else
        render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
      end
    end

    def autologin
      render json: {user: UserSerializer.new(logged_in_user)}
    end
  
    # def destroy
    #   session.delete :user_id
    #   if !session[:user_id]
    #     render json: {
    #       notice: "successfully logged out"
    #     }, status: :ok
    #   else
    #     render json: {
    #       error: "Unsuccessful log out"
    #     }
    #   end
    # end
end  