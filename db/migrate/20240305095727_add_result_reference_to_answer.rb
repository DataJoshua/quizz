class AddResultReferenceToAnswer < ActiveRecord::Migration[7.0]
  def change
    add_reference :answers, :result, foreign_key: true
  end
end
