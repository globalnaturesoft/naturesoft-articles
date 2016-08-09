module Naturesoft::Articles
  class Article < ApplicationRecord
		mount_uploader :image_url, Naturesoft::Articles::ArticleUploader
		
    belongs_to :user
    belongs_to :article_image
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
    
    def self.status
      [
        ["All",""],
        ["Active","true"],
        ["Inactive","false"]
      ]
    end
    
    #Filter, Sort
    def self.search(params)
      records = self.all
      
      #Search keyword filter
      if params[:keyword].present?
        params[:keyword].split(" ").each do |k|
          records = records.where("LOWER(CONCAT(naturesoft_articles_articles.title)) LIKE ?", "%#{k.strip.downcase}%") if k.strip.present?
        end
      end
      
      # for sorting
      sort_by = params[:sort_by].present? ? params[:sort_by] : "naturesoft_articles_articles.title"
      sort_orders = params[:sort_orders].present? ? params[:sort_orders] : "asc"
      records = records.order("#{sort_by} #{sort_orders}")
      
      return records
    end
    
    # change approve
    def approve
			update_columns(approved: true)
		end
    
    def disapprove
			update_columns(approved: false)
		end
    
    # change status
    def enable
			update_columns(status: "active")
		end
    
    def disable
			update_columns(status: "inactive")
		end
  end
end
