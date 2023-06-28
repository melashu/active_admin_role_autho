class AddStundetToPost < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :student, null: false, foreign_key: true
  end
end
