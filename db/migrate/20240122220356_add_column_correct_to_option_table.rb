class AddColumnCorrectToOptionTable < ActiveRecord::Migration[7.0]
  def change
    add_column :options, :correct, :boolean
  end
end
