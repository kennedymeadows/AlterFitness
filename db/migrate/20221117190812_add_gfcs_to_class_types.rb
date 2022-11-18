class AddGfcsToClassTypes < ActiveRecord::Migration[7.0]
  def change
    add_reference :class_types, :gfc, null: true, foreign_key: true
  end
end
