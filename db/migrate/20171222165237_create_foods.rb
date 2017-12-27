class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.date   :date
      t.boolean :goalMet
      t.integer :foodPoint
      t.integer :foodGoal

      t.timestamps
      t.references :user, index: true
      t.references :log, index: true
      t.references :goal, index: true
    end
  end
end
