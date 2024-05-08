module Quizzes
  class Create
    class CreateQuizDeprecateJob
      include Interactor

      delegate :quiz, to: :context

      def call
        if quiz.due_until.present?
          QuizJob.perform_at(quiz.due_until, quiz.id)
        end
      end
    end
  end
end
