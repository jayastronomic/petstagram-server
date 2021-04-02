module Api  
    module V1
        class UsersController < ApplicationController

            def create
                @user = User.new(user_params)
                if @user.save
                  login!
                  render json: { status: 'SUCCESS', user: @user, logged_in: true }
                else 
                  render json: { status: 500, errors: @user.errors.full_messages}
                end
            end

            private
            
            def user_params
                params.require(:user).permit(
                    :username,
                    :full_name,
                    :email,
                    :password,
                    :password_confirmation
                )
            end
        end
    end
end