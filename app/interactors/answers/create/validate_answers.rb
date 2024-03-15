module Answers
  class Create
    class ValidateAnswers
      include Interactor

      delegate :result, to: :context

      def call
        context.fail!(error: "Answers not updated!") unless update_result!
      end

      private

      def update_result!
        answers = []
        questions = []

        result.result_questions.each do |question|
          question_value = question.question.value
          question_correct_options = question.question.correct_options
          correct_answers = 0

          question.answers.each do |answer|
            if answer.checked
              answer.correct = answer.option.correct
              answers << answer

              correct_answers += 1 if answer.option.correct
            end
          end

          score = (correct_answers / question_correct_options) * question_value

          question.score = score
          questions << question
        end

        Result.transaction do
          Answer.import! answers, on_duplicate_key_update: [:correct]
          ResultQuestion.import! questions, on_duplicate_key_update: [:score]
          result.update(total_score: result.result_questions
                                           .pluck(:score).sum)
        end
      end
    end
  end
end
