class Question < ApplicationRecord
  belongs_to :quiz
  has_many :options, dependent: :destroy
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :options, allow_destroy: true, reject_if: :all_blank

  validates :content, presence: true
end
