class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.references :event
      t.references :entity
      t.string :role

      t.timestamps
    end
    add_index :participants, :event_id
    add_index :participants, :entity_id
  end
end
