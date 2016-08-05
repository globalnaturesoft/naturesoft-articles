module Naturesoft::Articles
  class Article < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :categories
    
    scope :ordered, -> { order('created_at desc') }
    
    def self.sort_by
      [
        ["Title","naturesoft_articles_articles.title"],
        ["Created At","naturesoft_articles_articles.created_at"]
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
      
      if params[:article_id].present?
        records = records.where(article_id: params[:article_id])
      end
      
      #Search keyword filter
      if params[:keywords].present?
        params[:keywords].split(" ").each do |k|
          records = records.where("LOWER(CONCAT(naturesoft_articles_articles.title)) LIKE ?", "%#{k.strip.downcase}%") if k.strip.present?
        end
      end
      
      # for sorting
      sort_by = params[:sort_by].present? ? params[:sort_by] : "naturesoft_articles_articles.title"
      sort_orders = params[:sort_orders].present? ? params[:sort_orders] : "asc"
      records = records.order("#{sort_by} #{sort_orders}")
      
      return records
    end
  end
end
