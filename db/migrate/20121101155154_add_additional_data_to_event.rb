class AddAdditionalDataToEvent < ActiveRecord::Migration
  def change
    add_column :events, :summary, :text
    add_column :events, :schedule, :text
    add_column :events, :rules, :text
    add_column :events, :registration, :text
  end
end
