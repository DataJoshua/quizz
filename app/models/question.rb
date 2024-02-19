class Question < ApplicationRecord
  belongs_to :quiz
  has_many :options, dependent: :destroy

  accepts_nested_attributes_for :options, allow_destroy: true, reject_if: :all_blank

  validates :content, :value, presence: true
  validates :value, numericality: { allow_blank: true, greater_than_or_equal_to: 0 }
end
