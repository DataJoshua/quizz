module Students
  class DashboardsController < ApplicationController
    def show
      @quizzes = Quiz.all
    end
  end
end
