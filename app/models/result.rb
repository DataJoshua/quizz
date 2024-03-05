class Result < ApplicationRecord
  belongs_to :user
  belongs_to :quiz

  has_many :answers, dependent: :destroy
end
