class AddArticleImageIdToNaturesoftArticlesArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_articles_articles, :image_id, :integer
  end
end
