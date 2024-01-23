module Teachers
  class DashboardsController < ApplicationController
    def show
      @quizzes = current_user.quizzes
    end
  end
end
