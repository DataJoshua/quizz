module Turbo
  module Teachers
    class QuizzesController < ApplicationController
      def create
        @quiz = Quiz.new(quiz_params)
  
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
        @create_quiz ||= Quizzes::Create.call(quiz: @quiz, user: current_user)
      end

      def quiz_params
        params.require(:quiz)
              .permit(:name, questions_attributes: [:id,
                                             :content,
                                             :_destroy, 
                                             options_attributes: %i[id _destroy content correct]])
      end
    end
  end
end
