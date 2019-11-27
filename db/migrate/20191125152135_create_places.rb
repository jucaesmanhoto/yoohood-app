class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode
      t.float :latitude
      t.float :logitude
      t.integer :capacity

      t.references :event, foreign_key: true
      t.timestamps
    end
  end
end
