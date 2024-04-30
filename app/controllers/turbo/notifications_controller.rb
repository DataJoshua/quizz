module Turbo 
  class NotificationsController < ApplicationController
    def create
      flash[:notice] = notification_params[:msg]
    end

    private

    def notification_params
      params.require(:notification).permit(:msg)
    end
  end
end
