module Students
  class DashboardsController < ApplicationController
    def show
      @quizzes = Quiz.all.order(created_at: :desc)
    end
  end
end
