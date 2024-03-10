class AnswerPolicy < ApplicationPolicy
  def create?
    user.results.where(quiz: record).empty?
  end
end
