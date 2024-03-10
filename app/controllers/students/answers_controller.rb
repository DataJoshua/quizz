module Students
  class AnswersController < ApplicationController
    include Authorization
    before_action :authenticate_user!
    before_action :set_quiz

    def create
      authorize! @quiz, with: AnswerPolicy

      if create_answers.success?
        flash[:notice] = "Answers saved"
      else
        flash[:alert] = create_answers.error
      end

      redirect_to quiz_path(@quiz)
    end

    private

    def set_quiz
      @quiz = Quiz.find_by(id: params[:quiz_id])
    end

    def create_answers
      @create_answer ||= Answers::Create.call(solution_params: solution_params, user: current_user, quiz: @quiz)
    end

    def solution_params
      params[:answers].values
    end
  end
end
