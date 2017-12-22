class CreateSleeps < ActiveRecord::Migration[5.0]
  def change
    create_table :sleeps do |t|
      t.date   :date
      t.boolean :goalMet
      t.integer :sleepGoal
      t.integer :sleepPoint


      t.timestamps
      t.references :user, index: true, foreign_key: true
      t.references :log, index: true, foreign_key: true
      t.references :goal, index: true, foreign_key: true
    end
  end
end
