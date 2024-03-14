class CreateResultQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :result_questions do |t|
      t.references :result
      t.references :question

      t.timestamps
    end
  end
end
