module Naturesoft::Articles
  class Category < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :articles
    has_many :parent_categories, dependent: :destroy
    has_many :parent, through: :parent_categories, source: :parent
    has_many :child_categories, class_name: "ParentCategory", foreign_key: "parent_id", dependent: :destroy
    has_many :children, through: :child_categories, source: :category
    
    scope :ordered, -> { order('created_at desc') }
    
    def update_level(lvl)
      self.level = lvl
      self.save
    end
    
  end
end
