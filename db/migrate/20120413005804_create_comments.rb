class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :commentable_id
      t.string :commentable_type
      t.integer :user_id

      t.timestamps
    end

    add_index :comments, :user_id
    add_index :comments, :commentable_type
    add_index :comments, :commentable_id
  end
end
