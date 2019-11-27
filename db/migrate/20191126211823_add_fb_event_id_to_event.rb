class AddFbEventIdToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :fb_event_id, :string
  end
end
