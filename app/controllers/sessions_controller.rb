class SessionsController < ApplicationController
  before_action :vefify_user_session!, only: %i[create new]

  def new; end

  def create
    @user = User.find_by(username: user_params[:username])

    if @user&.authenticate(user_params[:password])
      session[:current_user_id] = @user.id

      redirect_to dashboard_path
    else
      flash.now[:alert] = "User does not exist"

      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:current_user_id] = nil

    flash[:notice] = "You have logged out"

    redirect_to new_session_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
