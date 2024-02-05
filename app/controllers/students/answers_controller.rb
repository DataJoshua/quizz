module Students
  class AnswersController < ApplicationController
    before_action :authenticate_user!

    def create
      if create_answers.success?
        flash[:notice] = "Answers saved"
      else
        flash[:alert] = create_answers.error
      end

      redirect_to dashboard_path
    end

    private

    def create_answers
      @create_answer ||= Answers::Create.call(solution_params: solution_params, user: current_user)
    end

    def solution_params
      params[:answers].values
    end
  end
end
