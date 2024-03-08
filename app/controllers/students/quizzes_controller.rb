module Students
  class QuizzesController < ApplicationController
    def show
      @quiz = Quiz.includes(questions: [:options])
                  .find(params[:id])
                  .decorate

      @answers = current_user
                       .results
                       .find_by(quiz: @quiz)
                       &.answers
    end
  end
end
