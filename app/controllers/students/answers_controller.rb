module Students
  class AnswersController < ApplicationController
    include Authorization
    before_action :authenticate_user!
    before_action :set_quiz

    def create
      authorize! @quiz, with: AnswerPolicy

      if create_result.success?
        flash[:notice] = "Answers saved"
      else
        flash[:alert] = create_result.error
      end

      redirect_to quiz_path(@quiz)
    end

    private

    def set_quiz
      @quiz = Quiz.find_by(id: params[:quiz_id])
    end

    def create_result
      @create_answer ||= Answers::Create.call(result_params: result_params, user: current_user, quiz: @quiz)
    end

    def result_params
      params.require(:result)
            .permit(result_questions_attributes: [:question_id,
                                                  :id, 
                                                  answers_attributes: %i[id checked option_id]])
    end
  end
end
