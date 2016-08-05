class AddApprovedToNaturesoftArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_articles_articles, :approved, :boolean, default: false
  end
end