class User < ApplicationRecord
  rolify
  has_and_belongs_to_many :quizzes, join_table: :user_quizzes
  has_many :results, dependent: :destroy

  has_secure_password
end
