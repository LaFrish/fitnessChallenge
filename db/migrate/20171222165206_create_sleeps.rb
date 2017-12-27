class CreateSleeps < ActiveRecord::Migration[5.0]
  def change
    create_table :sleeps do |t|
      t.date   :date
      t.boolean :goalMet
      t.integer :sleepGoal
      t.integer :sleepPoint


      t.timestamps
      t.references :user, index: true
      t.references :log, index: true
      t.references :goal, index: true
    end
  end
end
