module Answers
  class Create
    class ValidateAnswers
      include Interactor

      delegate :result, to: :context

      def call
        result.answers.each do |answer|
          is_correct = answer.option.correct

          answer.update(correct: is_correct) if answer.checked
        end
      end
    end
  end
end
