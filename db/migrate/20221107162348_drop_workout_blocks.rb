class DropWorkoutBlocks < ActiveRecord::Migration[7.0]
  def change
    drop_table :workout_blocks
  end
end
