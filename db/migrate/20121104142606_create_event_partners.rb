class CreateEventPartners < ActiveRecord::Migration
  def change
    create_table :event_partners do |t|
      t.references :event
      t.references :entity
      t.string :role
      t.text :custom_blurb

      t.timestamps
    end

    add_index :event_partners, :event_id
    add_index :event_partners, :entity_id
  end
end
