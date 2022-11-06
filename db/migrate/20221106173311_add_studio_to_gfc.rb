class AddStudioToGfc < ActiveRecord::Migration[7.0]
  def change
    add_column :gfcs, :studio, :boolean, default: false
  end
end
