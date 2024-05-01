module Teachers
  class DashboardsController < ApplicationController
    expose :raw_quizzes, -> { current_user.quizzes.order(created_at: :desc) }
    expose :paginated_quizzes, -> { pagy(raw_quizzes, items: 5) }
    expose :quizzes, -> { paginated_quizzes.last }

    def show; end
  end
end
