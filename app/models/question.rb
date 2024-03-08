class Question < ApplicationRecord
  belongs_to :quiz
  has_many :options, dependent: :destroy
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :options, allow_destroy: true, reject_if: :all_blank

  validates :content, presence: true
  validate :validate_at_least_one_correct_option
  validate :validate_at_least_two_options_are_present

  private

  def validate_at_least_one_correct_option
    return if options.any?(&:correct)

    errors.add(:questions, "At least one question must be correct")
  end

  def validate_at_least_two_options_are_present
    return if options.size >= 2

    errors.add(:questions, "You have to create at least 2 options for each question")
  end
end
