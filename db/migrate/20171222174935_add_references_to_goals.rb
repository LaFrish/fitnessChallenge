class AddReferencesToGoals < ActiveRecord::Migration[5.0]
  def change
    add_reference :goals, :logs, index: true, foreign_key: true
  end
end
