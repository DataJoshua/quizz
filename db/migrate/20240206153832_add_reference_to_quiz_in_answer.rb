class AddReferenceToQuizInAnswer < ActiveRecord::Migration[7.0]
  def change
    add_reference :answers, :quiz
  end
end
