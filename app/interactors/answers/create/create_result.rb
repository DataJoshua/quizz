module Answers
  class Create
    class CreateResult
      include Interactor

      delegate :user, :quiz, to: :context

      def call
        context.fail!(error: result_errors) unless result.save

        context.result = result
      end

      private

      def result
        @result ||= Result.new(user: user, quiz: quiz)
      end

      def result_errors
        result.errors.full_messages.join(", ")
      end
    end
  end
end
