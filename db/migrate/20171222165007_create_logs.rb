class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.date   :date
      t.string :water
      t.string :sleep
      t.string :workout
      t.string :food
      t.string :goal
      t.integer :point
      t.integer :totalPoints
      t.integer :weightStatus
      t.boolean :weeklyGoalMet

      t.timestamps
      t.references :user, index: true, foreign_key: true
      t.references :goal, index: true, foreign_key: true
    end
  end
end
