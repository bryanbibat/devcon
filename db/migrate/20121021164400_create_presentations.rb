class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.string :name
      t.string :slug
      t.references :event
      t.references :speaker
      t.string :slide_link
      t.string :video_link
      t.text :description

      t.timestamps
    end
    add_index :presentations, :slug, :unique => true
    add_index :presentations, :event_id
    add_index :presentations, :speaker_id
  end
end
