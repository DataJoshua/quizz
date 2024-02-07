class AnswerPolicy < ApplicationPolicy
  def create?
    user.answers.where(quiz: record).empty?
  end
end
