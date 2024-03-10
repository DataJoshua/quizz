module Answers
  class Create
    class Execute
      include Interactor

      delegate :solution_params, :user, :result, :quiz, to: :context

      def call
        answers = []

        solution_params.each do |answer_params|
          params = answer_params.merge(result: result)

          answers << Answer.new(params)
        end

        begin
          Answer.import!(answers)
        rescue ActiveRecord::RecordInvalid => e
          context.fail!(error: e.message)
        end
      end
    end
  end
end
