class DeleteFromAsnwersUserAndQuizReference < ActiveRecord::Migration[7.0]
  def change
    remove_reference :answers, :user
    remove_reference :answers, :quiz
  end
end
