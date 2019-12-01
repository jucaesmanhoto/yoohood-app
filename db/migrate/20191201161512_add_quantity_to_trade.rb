class AddQuantityToTrade < ActiveRecord::Migration[5.2]
  def change
    add_column :trades, :quantity, :integer
  end
end
