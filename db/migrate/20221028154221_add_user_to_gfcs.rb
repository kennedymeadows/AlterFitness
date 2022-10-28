class AddUserToGfcs < ActiveRecord::Migration[7.0]
  def change
    add_reference :gfcs, :user, null: false, foreign_key: true
  end
end
