module Quizzes
  class Create
    class UpdateQuizScore
      include Interactor

      delegate :quiz, to: :context

      def call
        context.fail!(error: "Quiz was not updated") unless quiz.update(quiz_update_params)
      end
      
      private
      
      def quiz_update_params
        total_score = quiz.questions.pluck(:value).sum

        {
          score: total_score
        }
      end
    end
  end
end
