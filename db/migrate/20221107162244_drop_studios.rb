class DropStudios < ActiveRecord::Migration[7.0]
  def change
    drop_table :studios
  end
end
