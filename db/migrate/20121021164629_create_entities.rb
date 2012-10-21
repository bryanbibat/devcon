class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.text :blurb
      t.string :logo
      t.string :type
      t.string :level

      t.timestamps
    end

    add_index :entities, :slug, :unique => true
    add_index :entities, :type
    add_index :entities, :level
  end
end
