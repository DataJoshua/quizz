class Result < ApplicationRecord
  belongs_to :user
  belongs_to :quiz

  has_many :result_questions, dependent: :destroy

  accepts_nested_attributes_for :result_questions
end
