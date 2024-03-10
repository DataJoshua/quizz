class AddCheckedToAnswersAndRemovedCorrectFromOptions < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :checked, :boolean
  end
end
