class RegistrationsController < ApplicationController
  before_action :vefify_user_session!

  def new
    @roles = Role.all
  end
end
