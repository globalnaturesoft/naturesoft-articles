class CreateNaturesoftArticlesParentCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_articles_parent_categories do |t|
      t.integer :parent_id
      t.integer :category_id

      t.timestamps
    end
  end
end
