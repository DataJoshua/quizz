module Users
  class Create
    class FindRole
      include Interactor

      delegate :user_params, to: :context

      def call
        role = Role.find_by(id: user_params[:role])

        context.fail!(error: "Role does not exists") unless role.present?

        context.role = role
      end
    end
  end
end
