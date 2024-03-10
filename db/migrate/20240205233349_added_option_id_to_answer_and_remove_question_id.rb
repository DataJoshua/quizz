class AddedOptionIdToAnswerAndRemoveQuestionId < ActiveRecord::Migration[7.0]
  def change
    remove_reference :answers, :question
    add_reference :answers, :option
  end
end
