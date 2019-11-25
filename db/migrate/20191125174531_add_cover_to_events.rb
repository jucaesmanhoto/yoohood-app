class AddCoverToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :cover, :string
  end
end
