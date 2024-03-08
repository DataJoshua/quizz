module Students
  class QuizzesController < ApplicationController
    def show
      @quiz = Quiz.includes(questions: [:options])
                  .find(params[:id])
                  .decorate

      @answers = Result.find_by(user: current_user, quiz: @quiz)&.answers
    end
  end
end
