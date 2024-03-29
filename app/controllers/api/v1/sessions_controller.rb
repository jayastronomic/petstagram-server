module Api
    module V1
        class SessionsController < ApplicationController

            def create
                @user = User.find_by(email: session_params[:email]) || User.find_by(username: session_params[:username])
              
                if @user && @user.authenticate(session_params[:password])
                  login!
                  render json: { logged_in: true, user: @user }
                else
                  render json: { status: 401, errors: ['no such user', 'verify credentials and try again or signup'] }
                end
            end
              
            def is_logged_in?
                if logged_in? && current_user
                  render json: current_user
                else
                  render json: { logged_in: false, user: {}, message: 'no such user' }
                end
            end

            def destroy
                logout! 
                render json: { status: 200, user: {}, logged_in: false }
            end

            private

            def session_params
                params.require(:user).permit(
                    :username, 
                    :email, 
                    :password)
            end
        end
    end
end
