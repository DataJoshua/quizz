class AddScoreToResutlQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :result_questions, :score, :integer
    add_column :questions, :correct_options, :integer
  end
end
