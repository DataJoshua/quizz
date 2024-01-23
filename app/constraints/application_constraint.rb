class ApplicationConstraint
  def current_user(id)
    @user ||= User.find_by(id:)    
  end
end
