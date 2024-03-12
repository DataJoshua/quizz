module Answers
  class Create
    class ValidateAnswers
      include Interactor

      # TODO: to reload the result model before the transaction may handle some future bugs
      delegate :result, to: :context

      def call
        context.fail!(error: "Answers not updated!") unless update_answers!
      end

      private

      def update_answers!
        Answer.transaction do
          # Fetch all the answers that answer.option.correct = true and update the /
          # answer.correct to true
          result.answers
                .joins(:option)
                .where(checked: true, option: { correct: true })
                .update_all(correct: true)

          # Fetch all the answers that answer.option.correct = false, and update the /
          # answer.correct to false
          result.answers
                .joins(:option)
                .where(checked: true, option: { correct: false })
                .update_all(correct: false)

          result.update(total_score: result_total_points)
        end
      end

      def result_total_points
        total_points = 0

        # This just works if each question just have a single correct answer
        result.answers
              .includes(option: [:question])
              .where(checked: true)
              .each do |answer|

          if answer.option.correct            
            question = answer.option.question
            questions_points = question.value

            total_points+= questions_points
          end
        end

        total_points
      end
    end
  end
end
