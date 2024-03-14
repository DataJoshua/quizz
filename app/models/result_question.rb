class ResultQuestion < ApplicationRecord
  belongs_to :result
  belongs_to :question

  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers
end
