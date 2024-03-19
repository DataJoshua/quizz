module Quizzes
  class Create
    class Execute
      include Interactor
      
      delegate :quiz_params, to: :context

      def call
        context.fail!(error: quiz_errros) unless quiz.failed_instances.empty?

        context.quiz = Quiz.includes(questions: [:options])
                           .find_by(id: quiz.ids.first)
      end

      private

      def quiz
        quiz_obj = Quiz.new(quiz_params)

        @quiz ||= Quiz.import [quiz_obj], recursive: true, track_validation_failures: true, all_or_none: true
      end

      def quiz_errros
        quiz.failed_instances
            .first
            .last
            .errors
            .full_messages
            .join(", ")
      end
    end
  end
end
