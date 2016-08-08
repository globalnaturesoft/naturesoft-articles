class AddStatusToNaturesoftCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_articles_categories, :status, :string, default: "active"
  end
end
