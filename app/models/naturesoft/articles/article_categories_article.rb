module Naturesoft::Articles
  class ArticleCategoriesArticle < ApplicationRecord
    belongs_to :article
    belongs_to :article_category
  end
end
