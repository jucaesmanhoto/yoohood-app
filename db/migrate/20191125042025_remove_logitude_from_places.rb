class RemoveLogitudeFromPlaces < ActiveRecord::Migration[5.2]
  def change
    remove_column :places, :logitude, :float
  end
end
