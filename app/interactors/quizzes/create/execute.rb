module Quizzes
  class Create
    class Execute
      include Interactor
      
      delegate :quiz_params, to: :context

      def call
        context.fail!(error: quiz_errors) unless quiz.save

        context.quiz = quiz
      end

      private

      def quiz
        @quiz ||= Quiz.new(quiz_params)
      end

      def quiz_errors
        quiz.errors.full_messages.join(", ")
      end
    end
  end
end
