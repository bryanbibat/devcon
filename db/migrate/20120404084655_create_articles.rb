class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.integer :author_id

      t.timestamps
    end
    add_index :articles, [:author_id, :created_at]
  end
end
