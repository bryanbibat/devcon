class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.references :venue
      t.datetime :start_at
      t.datetime :end_at
      t.text :description
      t.integer :parent_id
      t.string :logo
      t.string :devcon_role

      t.timestamps
    end

    add_index :events, :slug, :unique => true
    add_index :events, :venue_id
    add_index :events, :parent_id
  end
end
