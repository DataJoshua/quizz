module Students
  class DashboardsController < ApplicationController
    expose :raw_quizzes, -> { Quiz.all.order(created_at: :desc).kept }
    expose :paginated_quizzes, -> { pagy(raw_quizzes, items: 5) }
    expose :quizzes, -> { paginated_quizzes.last }

    def show; end
  end
end
