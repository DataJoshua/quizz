module Authentication
  extend ActiveSupport::Concern

  class UnAuthenticateUser < StandardError; end

  included do
    rescue_from UnAuthenticateUser, with: :user_unauthenticated!

    helper_method :current_user
  end

  def current_user
    @user ||= User.find_by(id: session[:current_user_id])
  end

  def authenticate_user!
    return if user_signed_in?

    raise UnAuthenticateUser, "User not authenticated"
  end

  def vefify_user_session!
    return unless user_signed_in?

    flash[:notice] = "You are already logged in!"

    redirect_to dashboard_path
  end

  private

  # TODO: maybe this method could be used as helper_method too
  def user_signed_in?
    current_user.present? && session[:current_user_id]
  end

  def user_unauthenticated!
    flash[:notice] = "Please authenticate"

    redirect_to new_session_path
  end
end
