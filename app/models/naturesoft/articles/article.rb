module Naturesoft::Articles
  class Article < ApplicationRecord
		mount_uploader :image_url, Naturesoft::Articles::ArticleUploader
		validates :title, :content, presence: true
		validates :image_url, presence: true
		validates :image_url, allow_blank: true, format: {
			with: %r{\.(gif|jpg|png)\Z}i,
			message: 'must be a URL for GIF, JPG or PNG image.'
		}
		
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
    
    # data for select2 ajax
    def self.select2(params)
			items = self.search(params)
			if params[:excluded].present?
				items = items.where.not(id: params[:excluded].split(","))
			end
			options = [{"id" => "nil", "text" => "none"}]
			options += items.map { |c| {"id" => c.id, "text" => c.title} }
			result = {"items" => options}
		end
    
    # get all articles
    def self.get_all_article
			Article.where(status: "active").where(approved: true)
		end
    
    # get recent posts/newest articles
    def self.get_recent_posts(num=5)
			Article.get_all_article.order("created_at desc").limit(5)
		end
    
    # get posts by category (module menus)
    def self.get_posts_for_category(params)
			records = Article.get_all_article.joins(:categories).where(naturesoft_articles_categories: {id: params[:cat_id]}).uniq
			return records
		end
    
    def get_tags
			tags.to_s.split(/[\,\;]/).select {|c| c.present? }
		end
    
    # Search for frontend
    def self.search_frontend(params)
      records = self.get_posts_for_category(params)
      
      #Search keyword filter
      if params[:key].present?
        params[:key].split(" ").each do |k|
          records = records.where("LOWER(CONCAT(naturesoft_articles_articles.title)) LIKE ?", "%#{k.strip.downcase}%") if k.strip.present?
        end
      end      
      return records
    end
    
  end
end
