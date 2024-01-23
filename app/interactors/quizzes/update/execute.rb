module Quizzes
  class Update
    class Execute
      include Interactor

      delegate :quiz, :quiz_params, to: :context

      def call
        context.fail!(error: quiz_errors) unless quiz.update(quiz_params)
      end

      private

      def quiz_errors
        quiz.errors.full_messages.join(", ")
      end
    end
  end
end
