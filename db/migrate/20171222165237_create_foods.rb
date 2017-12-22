class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.date   :date
      t.boolean :goalMet
      t.integer :foodPoint
      t.integer :foodGoal

      t.timestamps
      t.references :user, index: true, foreign_key: true
      t.references :log, index: true, foreign_key: true
      t.references :goal, index: true, foreign_key: true
    end
  end
end
