class ChangePointsFromUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :points, :integer, default: 450
  end
end
