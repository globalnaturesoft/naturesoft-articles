module Naturesoft::Articles
  class ArticleCategory < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :articles
    has_many :parent_article_categories, dependent: :destroy
    has_many :parent, through: :parent_article_categories, source: :parent
    has_many :child_article_categories, class_name: "ParentArticleCategory", foreign_key: "parent_id", dependent: :destroy
    has_many :children, through: :child_article_categories, source: :article_category
    
    scope :ordered, -> { order('created_at desc') }
    
    def update_level(lvl)
      self.level = lvl
      self.save
    end
    
  end
end
