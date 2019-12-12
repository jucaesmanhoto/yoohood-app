class ChangeRatingInCheckins < ActiveRecord::Migration[5.2]
  def change
    change_column :checkins, :rating, :integer, default: 0
  end
end
