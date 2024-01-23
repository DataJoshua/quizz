module Turbo
  class RegistrationsController < ApplicationController
    def create
      @roles = Role .all
      @user = User.new(user_params.except(:role))

      if create_user.success?
        flash[:notice] = "User created!"
      else
        flash[:notice] = create_user.error
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:username, :password, :role)
    end
  
    def create_user
      @create_user ||= Users::Create.call(user: @user, user_params:)
    end
  end
end
