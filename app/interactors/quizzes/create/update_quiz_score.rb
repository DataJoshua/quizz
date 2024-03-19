module Quizzes
  class Create
    class UpdateQuizScore
      include Interactor

      delegate :quiz, to: :context

      def call
        context.fail!(error: "Quiz was not updated") unless quiz.update(quiz_update_params) && update_question_correct_options!
      end

      private

      def quiz_update_params
        total_score = quiz.questions.pluck(:value).sum

        {
          score: total_score
        }
      end

      def update_question_correct_options!
        questions = []

        quiz.questions.each do |question|
          correct_options = question.options
                                    .where(correct: true)
                                    .count.to_i

          question.correct_options = correct_options
          questions << question
        end

        Question.import! questions, on_duplicate_key_update: [:correct_options]
      end
    end
  end
end
