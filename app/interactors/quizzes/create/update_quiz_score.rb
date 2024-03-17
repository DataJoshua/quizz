module Quizzes
  class Create
    class UpdateQuizScore
      include Interactor

      delegate :quiz, to: :context

      def call
        context.fail!(error: "Quiz was not updated") unless update_all!
      end

      private

      def update_all!
        Quiz.transaction do
          quiz.update(quiz_update_params)
          update_question_correct_options!
        end
      end

      def quiz_update_params
        total_score = quiz.questions.pluck(:value).sum

        {
          score: total_score
        }
      end

      def update_question_correct_options!
        quiz.questions.each do |question|
          correct_options = question.options.where(correct: true).count.to_i

          question.update(correct_options: correct_options)
        end
      end
    end
  end
end
