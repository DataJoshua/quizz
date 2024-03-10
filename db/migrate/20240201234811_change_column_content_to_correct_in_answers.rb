class ChangeColumnContentToCorrectInAnswers < ActiveRecord::Migration[7.0]
  def change
    remove_column :answers, :content
    add_column :answers, :correct, :boolean
  end
end
