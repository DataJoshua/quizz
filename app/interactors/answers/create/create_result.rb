module Answers
  class Create
    class CreateResult
      include Interactor

      delegate :result_params, :user, :quiz, to: :context

      def call
        context.fail!(error: result_errors) unless result.failed_instances.empty?

        context.result = Result.includes(result_questions: [:question, answers: [:option]])
                               .find_by(id: result.ids.first)
      end

      private

      def result
        result_record = Result.new(result_params.merge(user:, quiz:))

        @result ||= Result.import!([result_record], recursive: true)
      end

      def result_errors
        result.errors.full_messages.join(", ")
      end
    end
  end
end
