class CreateNaturesoftArticleCategoriesArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_articles_article_categories_articles do |t|
      t.integer :article_id
      t.integer :article_category_id

      t.timestamps
    end
  end
end
