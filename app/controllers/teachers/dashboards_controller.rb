module Teachers
  class DashboardsController < ApplicationController
    expose :raw_quizzes, -> { current_user.quizzes.order(created_at: :desc) }
    expose :pagginated_quizzes, -> { pagy(raw_quizzes, items: 5) }
    expose :quizzes, -> { pagginated_quizzes.last }

    def show; end
  end
end
