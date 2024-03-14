module Answers
  class Create
    class CreateResult
      include Interactor

      delegate :result_params, :user, :quiz, to: :context

      def call
        #TODO: implement the Result.import! [result], returning: :id with Postgresql
        context.fail!(error: result_errors) unless result.save

        context.result = Result.includes(result_questions: [:question, answers: [:option]])
                               .find_by(id: result.id)
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
