module Answers
  class ValidateAnswers
    include Interactor

    delegate :quiz, to: :context

    def call
      questions = quiz.questions.includes(:options)
      answers = []

      questions.each do |question|
        question.options.each do |option|
          is_correct = option.correct

          option.answers.update_all(correct: is_correct)
        end
      end
    end
  end
end
