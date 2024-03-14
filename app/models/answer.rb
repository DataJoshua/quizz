class Answer < ApplicationRecord
  belongs_to :option
  belongs_to :result_question

  validate :correct_nil_on_create, on: :create

  private

  def correct_nil_on_create
    return if self.correct.nil?

    errors.add(:correct, "Must be null on create")
  end
end
