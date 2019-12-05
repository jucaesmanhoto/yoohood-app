class AddTicketUriToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :ticket_uri, :string
  end
end
