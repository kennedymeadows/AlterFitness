class CreateWorkoutBlocks < ActiveRecord::Migration[7.0]
  def change
    create_table :workout_blocks do |t|
      t.belongs_to :gfc, null: false, foreign_key: true

      t.timestamps
    end
  end
end
