class ArticlesCategories < ActiveRecord::Migration
  def up
    create_table :articles_categories, :id => false do |t|
      t.references :article
      t.references :category
    end
  end

  def down
    drop_table :articles_categories
  end
end
