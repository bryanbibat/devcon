class AddDraftToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :draft, :boolean, default: false
    add_index :articles, :draft
  end
end
