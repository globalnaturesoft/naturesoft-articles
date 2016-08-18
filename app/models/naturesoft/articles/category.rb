module Naturesoft::Articles
  class Category < ApplicationRecord
		validates :name, presence: true
    belongs_to :user
    has_and_belongs_to_many :articles
    has_many :parent_categories, dependent: :destroy
    has_many :parent, through: :parent_categories, source: :parent
    has_many :child_categories, class_name: "ParentCategory", foreign_key: "parent_id", dependent: :destroy
    has_many :children, through: :child_categories, source: :category
    
    def update_level(lvl)
      self.level = lvl
      self.save
    end
    
    def self.sort_by
      [
        ["Name","naturesoft_articles_categories.name"],
        ["Created At","naturesoft_articles_categories.created_at"]
      ]
    end
    def self.sort_orders
      [
        ["ASC","asc"],
        ["DESC","desc"]
      ]
    end
    
    #Filter, Sort
    def self.search(params)
      records = self.all
      
      #Search keyword filter
      if params[:keyword].present?
        params[:keyword].split(" ").each do |k|
          records = records.where("LOWER(CONCAT(naturesoft_articles_categories.name,' ',naturesoft_articles_categories.description)) LIKE ?", "%#{k.strip.downcase}%") if k.strip.present?
        end
      end
      
      # for sorting
      sort_by = params[:sort_by].present? ? params[:sort_by] : "naturesoft_articles_categories.name"
      sort_orders = params[:sort_orders].present? ? params[:sort_orders] : "asc"
      records = records.order("#{sort_by} #{sort_orders}")
      
      return records
    end
    
    # change status
    def enable
			update_columns(status: "active")
		end
    
    def disable
			update_columns(status: "inactive")
		end
    
    # get categories by level
    def self.get_by_level(lvl)
			self.where(level: 1)
		end
    
    def get_newest_article(params)
		end
    
  end
end
