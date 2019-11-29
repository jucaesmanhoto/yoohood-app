class CreateFbEventAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :fb_event_admins do |t|
      t.string :name
      t.string :fb_user_id

      t.timestamps
    end
  end
end
