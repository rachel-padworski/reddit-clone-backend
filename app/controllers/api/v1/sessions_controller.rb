class Api::V1::SessionsController < ApplicationController
  
    def login
      user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        render json: {user: UserSerializer.new(user)}, status: 200
      else
        render json: {
          error: "Invalid Username or Password"
        }
      end
    end
  
    # def get_current_user
    #   if logged_in?
    #     render json: current_user, status: 200
    #   else
    #     render json: {
    #       error: "No user logged in"
    #     }
    #   end
    # end
  
    def destroy
      session.delete :user_id
      if !session[:user_id]
        render json: {
          notice: "successfully logged out"
        }, status: :ok
      else
        render json: {
          error: "Unsuccessful log out"
        }
      end
    end
end  