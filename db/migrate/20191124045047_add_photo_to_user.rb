class AddPhotoToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :photo, :string
    add_column :users, :name, :string
    add_column :users, :points, :integer, default: 0
  end
end
