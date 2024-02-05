module Answers
  class Create
    include Interactor

    delegate :solution_params, :user, to: :context

    def call
      solution_params.each do |answer_params|
        params = answer_params.merge(user:).except(:option_id)

        answer = Answer.new(params)

        unless answer.save
          context.fail!(error: answer.errors.full_messages.join(", "))
        end
      end
    end
  end
end
