module Students
  class QuizzesController < ApplicationController
    before_action :authenticate_user!

    def show
      @quiz = Quiz.includes(questions: [:options])
                  .find(params[:id])
                  .decorate

      @result = current_user.results
                            .includes(:quiz, result_questions: [:answers])
                            .find_by(quiz: @quiz)&.decorate || Result.new
    end
  end
end
