class ChangeStatusOnInvite < ActiveRecord::Migration[5.2]
  def change
    change_column :invites, :status, :string, default: 'pending'
  end
end
