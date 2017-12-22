class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.string :water
      t.string :sleep
      t.string :workout
      t.string :food
      t.string :goal

      t.timestamps
      t.references :user, index: true, foreign_key: true
    end
  end
end
