class AddIntroTextToNaturesoftArticlesArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_articles_articles, :intro_text, :string
  end
end
