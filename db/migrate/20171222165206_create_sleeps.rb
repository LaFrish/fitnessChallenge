class CreateSleeps < ActiveRecord::Migration[5.0]
  def change
    create_table :sleeps do |t|

      t.timestamps
      t.references :user, index: true, foreign_key: true
      t.references :log, index: true, foreign_key: true
    end
  end
end
