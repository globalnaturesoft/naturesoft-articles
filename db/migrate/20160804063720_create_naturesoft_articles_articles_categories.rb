class CreateNaturesoftArticlesArticlesCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_articles_articles_categories do |t|
      t.references :category, index: true, references: :naturesoft_articles_categories
      t.references :article, index: true, references: :naturesoft_articles_articles

      t.timestamps
    end
  end
end
