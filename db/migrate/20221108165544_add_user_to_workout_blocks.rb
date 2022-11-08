class AddUserToWorkoutBlocks < ActiveRecord::Migration[7.0]
  def change
    add_reference :workout_blocks, :user, null: true, foreign_key: true
  end
end
