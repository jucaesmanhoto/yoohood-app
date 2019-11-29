class RemoveFbUserIdFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :fb_user_id, :string
  end
end
