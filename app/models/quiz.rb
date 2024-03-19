class Quiz < ApplicationRecord
  include Discard::Model

  has_and_belongs_to_many :users, join_table: :user_quizzes
  has_many :questions, dependent: :destroy

  accepts_nested_attributes_for :questions, allow_destroy: true, reject_if: :all_blank

  validates :name, presence: true
end
