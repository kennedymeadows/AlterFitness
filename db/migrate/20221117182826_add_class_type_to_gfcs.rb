class AddClassTypeToGfcs < ActiveRecord::Migration[7.0]
  def change
    add_reference :gfcs, :class_type, null: true, foreign_key: true
  end
end
