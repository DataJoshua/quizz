class Option < ApplicationRecord
  belongs_to :question
  has_many :answers

  validates :content, presence: true
end
