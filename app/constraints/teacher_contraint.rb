class TeacherContraint < ApplicationConstraint
  class << self
    def matches?(request)
      instance = new
      user_id = request.session[:current_user_id]

      return false unless user_id.present?
      
      instance.current_user(user_id)&.has_role?(:teacher)
    end
  end
end
