class CreateWaters < ActiveRecord::Migration[5.0]
  def change
    create_table :waters do |t|
      t.date   :date
      t.integer :waterDrank
      t.integer :waterGoal
      t.integer :point
      t.boolean :goalMet
      t.integer :waterPoint

      t.timestamps
      t.references :user, index: true
      t.references :log, index: true
      t.references :goal, index: true
    end
  end
end
