class AddSocialHandleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :social_handle, :string
  end
end
