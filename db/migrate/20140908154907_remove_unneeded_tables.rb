class RemoveUnneededTables < ActiveRecord::Migration
  def up
    drop_table :comments
    drop_table :resource_people
    drop_table :presentations
    drop_table :speakers
    drop_table :participants
  end
end
