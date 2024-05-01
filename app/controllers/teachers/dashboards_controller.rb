module Teachers
  class DashboardsController < ApplicationController
    def show
      @quizzes = current_user.quizzes.order(created_at: :desc)
    end
  end
end
