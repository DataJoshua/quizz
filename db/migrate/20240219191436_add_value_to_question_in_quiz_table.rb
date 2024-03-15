class AddValueToQuestionInQuizTable < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :value, :integer
  end
end
