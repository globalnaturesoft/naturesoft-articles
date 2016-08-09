class AddArticleImageIdToNaturesoftArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_articles_articles, :article_image_id, :integer
  end
end
