class AddDiscardedAtToQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_column :quizzes, :discarded_at, :datetime
    add_index :quizzes, :discarded_at
  end
end
