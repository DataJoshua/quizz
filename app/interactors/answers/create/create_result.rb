module Answers
  class Create
    class CreateResult
      include Interactor

      delegate :result_params, :user, :quiz, to: :context

      def call
        context.fail!(error: result_errors) unless result.save

        context.result = result
      end

      private

      def result
        @result ||= Result.new(result_params.merge(user:, quiz:))
      end

      def result_errors
        result.errors.full_messages.join(", ")
      end
    end
  end
end
