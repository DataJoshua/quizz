module Quizzes
  class Destroy
    class Execute
      include Interactor

      delegate :quiz, to: :context

      def call
        context.fail!(error: quiz_errors) unless quiz.destroy
      end

      private

      def quiz_errors
        quiz.errors.full_messages.join(", ")
      end
    end
  end
end
