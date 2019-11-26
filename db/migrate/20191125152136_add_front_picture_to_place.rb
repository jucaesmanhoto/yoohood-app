class AddFrontPictureToPlace < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :front_picture, :string
  end
end
