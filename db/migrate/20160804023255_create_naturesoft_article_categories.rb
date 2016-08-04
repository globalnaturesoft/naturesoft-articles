class CreateNaturesoftArticleCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_articles_article_categories do |t|
      t.string :name
      t.text :description
      t.references :user, index: true, references: :naturesoft_users

      t.timestamps
    end
  end
end
