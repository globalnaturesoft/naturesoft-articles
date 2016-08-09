class AddStatusToNaturesoftArticleImages < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_articles_article_images, :status, :string, default: "active"
  end
end
