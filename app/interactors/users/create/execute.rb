module Users
  class Create
    class Execute
      include Interactor

      delegate :user_params, :role, :user, to: :context

      def call
        context.fail!(error: user_errors) unless user.save

        user.add_role(role.name.to_sym)
      end

      private

      def user_errors
        user.errors.full_messages.join(", ")
      end
    end
  end
end
