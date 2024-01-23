class CreateOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :options do |t|
      t.string :content
      t.references :question

      t.timestamps
    end
  end
end
