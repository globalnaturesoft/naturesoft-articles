class CreateNaturesoftArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_articles_articles do |t|
      t.string :image_url
      t.string :title
      t.text :content
      t.references :user, index: true, foreign_key: :naturesoft_users

      t.timestamps
    end
  end
end
