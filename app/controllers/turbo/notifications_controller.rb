module Turbo 
  class NotificationsController < ApplicationController
    before_action do 
      ActionView::Base.class_eval do
        include Rails.application.routes.url_helpers
      end
    end

    def create
      flash[:notice] = notification_params[:msg]
      @quiz = Quiz.find_by(id: notification_params[:quiz_id])
    end

    private

    def notification_params
      params.require(:notification).permit(:msg, :quiz_id)
    end
  end
end
