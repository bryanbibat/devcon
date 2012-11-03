class AddPublishedAndDisplayFlags < ActiveRecord::Migration
  def change
    add_column :articles, :published, :boolean, :default => false
    add_column :articles, :published_at, :datetime
    add_index :articles, :published

    add_column :events, :published, :boolean, :default => false
    add_index :events, :published

    add_column :resource_people, :display, :boolean, :default => false
    add_index :resource_people, :display

    add_column :entities, :display, :boolean, :default => false
    add_index :entities, :display

    add_column :venues, :display, :boolean, :default => false
    add_index :venues, :display

    add_column :presentations, :display, :boolean, :default => false
    add_index :presentations, :display
  end
end
