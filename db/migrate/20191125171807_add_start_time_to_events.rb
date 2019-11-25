class AddStartTimeToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :start_time, :timestamp
  end
end
