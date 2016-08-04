class AddLevelToNaturesoftArticleCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_articles_article_categories, :level, :integer
  end
end
