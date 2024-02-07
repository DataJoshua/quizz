module Answers
  class Create
    class ValidateAnswers
      include Interactor
  
      delegate :quiz, :user, to: :context
  
      def call
        questions = quiz.questions.includes(:options)
  
        questions.each do |question|
          question.options.each do |option|
            is_correct = option.correct
  
            option.answers
                  .where(checked: true, user:)
                  .update_all(correct: is_correct)
          end
        end
      end
    end
  end
end
