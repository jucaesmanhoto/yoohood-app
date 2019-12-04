class AddTokenToInvite < ActiveRecord::Migration[5.2]
  def change
    add_column :invites, :token, :string
  end
end
