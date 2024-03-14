class AddResultQuestionIdToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_reference :answers, :result_question, foreign_key: true
    remove_reference :answers, :result
  end
end
