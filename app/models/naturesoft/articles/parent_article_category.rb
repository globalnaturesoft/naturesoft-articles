module Naturesoft::Articles
  class ParentArticleCategory < ApplicationRecord
    belongs_to :article_category
    belongs_to :parent, class_name: "ArticleCategory"
  end
end
