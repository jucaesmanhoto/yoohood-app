class CreateBenefits < ActiveRecord::Migration[5.2]
  def change
    create_table :benefits do |t|
      t.string :name
      t.integer :quantity
      t.integer :value_in_points
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
