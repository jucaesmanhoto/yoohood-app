class CreateEventFbEventAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :event_fb_event_admins do |t|
      t.references :event, foreign_key: true
      t.references :fb_event_admin, foreign_key: true
    end
  end
end
