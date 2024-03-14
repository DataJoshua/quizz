class AnswerPolicy < ApplicationPolicy
  def create?
    user.results.find_by(quiz: record).blank?
  end
end
