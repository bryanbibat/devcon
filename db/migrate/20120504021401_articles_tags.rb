class ArticlesTags < ActiveRecord::Migration
  def up
    create_table :articles_tags, :id => false do |t|
      t.references :article
      t.references :tag
    end
  end

  def down
    drop_table :articles_tags
  end
end
