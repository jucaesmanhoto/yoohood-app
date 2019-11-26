class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.boolean :featured
      t.string :start_time
      t.string :end_time
      t.string :cover_url
      t.string :title
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
