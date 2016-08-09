class CreateNaturesoftArticleImages < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_articles_article_images do |t|
      t.string :name
      t.integer :width
      t.integer :height
      t.string :image_style
      t.references :user, index: true, references: :naturesoft_users

      t.timestamps
    end
  end
end
