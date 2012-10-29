class AddAdditionalFieldsToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :slug, :string
    add_column :articles, :summary, :text
    add_column :articles, :thumbnail, :string
    add_index :articles, :slug, :unique => :true
  end
end
