module Answers
  class Create
    include Interactor

    delegate :solution_params, :user, to: :context

    def call
      answers = []

      solution_params.each do |answer_params|
        params = answer_params.merge(user_id: user.id).except(:option_id)

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
