class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.references :quiz
      t.references :user
      t.float :total_score

      t.timestamps
    end
  end
end
