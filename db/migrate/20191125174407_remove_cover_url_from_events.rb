class RemoveCoverUrlFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :cover_url, :string
  end
end
