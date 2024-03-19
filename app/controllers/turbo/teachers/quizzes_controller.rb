module Turbo
  module Teachers
    class QuizzesController < ApplicationController
      def create  
        if create_quiz.success?
          flash[:notice] = "Quiz created successfully"
  
          redirect_to dashboard_path
        else
          flash[:alert] = create_quiz.error

          render :new
        end
      end

      private

      def create_quiz
        @create_quiz ||= Quizzes::Create.call(quiz_params: quiz_params, user: current_user)
      end

      def quiz_params
        params.require(:quiz)
              .permit(:name, :due_until, questions_attributes: [:id,
                                             :value,
                                             :content,
                                             :_destroy, 
                                             options_attributes: %i[id _destroy content correct]])
      end
    end
  end
end
