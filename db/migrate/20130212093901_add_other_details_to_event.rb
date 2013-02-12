class AddOtherDetailsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :event_type, :string
    add_column :events, :target_attendees, :integer
    add_column :events, :actual_attendees, :integer
  end
end
