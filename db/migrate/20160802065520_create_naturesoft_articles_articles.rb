class CreateNaturesoftArticlesArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_articles_articles do |t|
      t.string :image_url
      t.string :title
      t.text :content
      t.string :status, default: "active"
      t.boolean :approved, default: false
      t.references :user, index: true, references: :naturesoft_users

      t.timestamps
    end
  end
end
