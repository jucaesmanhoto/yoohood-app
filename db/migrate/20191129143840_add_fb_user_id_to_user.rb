class AddFbUserIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :fb_user_id, :string
  end
end
