class CreateClassTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :class_types do |t|
      t.string :title
      t.integer :block_count
      t.timestamps
    end
  end
end
