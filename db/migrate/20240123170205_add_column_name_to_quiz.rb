class AddColumnNameToQuiz < ActiveRecord::Migration[7.0]
  def change
    add_column :quizzes, :name, :string
  end
end
