module Turbo 
  class NotificationsController < ApplicationController
    before_action do 
      ActionView::Base.class_eval do
        include Rails.application.routes.url_helpers
      end
    end

    expose :raw_quizzes, -> { Quiz.all.order(created_at: :desc).kept }
    expose :paginated_quizzes, -> { pagy(raw_quizzes, items: 5, anchor_string: "data-turbo-stream='true'") }
    expose :quizzes, -> { paginated_quizzes.last }

    def show
      flash.now[:notice] = params[:msg]
    end
  end
end
