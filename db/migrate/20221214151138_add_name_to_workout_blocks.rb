class AddNameToWorkoutBlocks < ActiveRecord::Migration[7.0]
  def change
    add_column :workout_blocks, :name, :string
  end
end
