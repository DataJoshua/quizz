module Quizzes
  class Create
    class CreateQuizDeprecateJob
      include Interactor

      delegate :quiz, to: :context

      def call
        if quiz.due_until.present?
          QuizJob.set(wait_until: quiz.due_until).perform_later(quiz: quiz)
        end
      end
    end
  end
end
