class CreateResourcePeople < ActiveRecord::Migration
  def change
    create_table :resource_people do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.string :main_title
      t.string :thumbnail

      t.timestamps
    end

    add_index :resource_people, :slug
  end
end
