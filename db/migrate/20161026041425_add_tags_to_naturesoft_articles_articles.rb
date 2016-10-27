class AddTagsToNaturesoftArticlesArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_articles_articles, :tags, :string
  end
end
