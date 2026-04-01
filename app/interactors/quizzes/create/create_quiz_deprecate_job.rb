module Quizzes
  class Create
    class CreateQuizDeprecateJob
      include Interactor

      delegate :quiz, to: :context

      def call
        if quiz.due_until.present?
          delay = quiz.due_until - Time.now
          QuizJob.set(wait: delay.seconds).perform_async(quiz.id)
        end
      end
    end
  end
end
