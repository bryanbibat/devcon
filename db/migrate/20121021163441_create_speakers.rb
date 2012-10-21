class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :name
      t.string :slug
      t.text :description

      t.timestamps
    end

    add_index :speakers, :slug, :unique => true
  end
end
