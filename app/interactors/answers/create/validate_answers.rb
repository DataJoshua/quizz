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
        Result.transaction do
          result.result_questions.each do |question|
            question_value = question.question.value
            question_correct_options = question.question.correct_options
            correct_answers = 0

            question.answers.each do |answer|
              answer.update(correct: answer.option.correct) if answer.checked

              if answer.checked && answer.option.correct
                correct_answers += 1
              end
            end

            score = (correct_answers / question_correct_options) * question_value

            question.update(score: score)
          end

          result.update(total_score: result.result_questions
                                           .pluck(:score).sum)
        end
      end
    end
  end
end
