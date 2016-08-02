module Naturesoft::Articles
  class Article < ActiveRecord::Base
    belongs_to :user
    scope :ordered, -> { order('created_at desc') }
  end
end
