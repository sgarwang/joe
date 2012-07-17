class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :name
      t.integer :event_id

      t.timestamps
    end
  end
end
