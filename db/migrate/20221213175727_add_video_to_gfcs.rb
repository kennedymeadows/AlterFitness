class AddVideoToGfcs < ActiveRecord::Migration[7.0]
  def change
    add_reference :gfcs, :videos, null: true, foreign_key: true
  end
end
