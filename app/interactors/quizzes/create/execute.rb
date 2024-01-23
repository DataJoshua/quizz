module Quizzes
  class Create
    class Execute
      include Interactor
      
      delegate :quiz, to: :context

      def call
        content.fail!(error: quiz_errors) unless quiz.save
      end

      private

      def quiz_errors
        quiz.errors.full_messages.join(", ")
      end
    end
  end
end
