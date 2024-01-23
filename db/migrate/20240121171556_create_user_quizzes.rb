class CreateUserQuizzes < ActiveRecord::Migration[7.0]
  def change
    create_table :user_quizzes do |t|
      t.references :user
      t.references :quiz

      t.timestamps
    end
  end
end
