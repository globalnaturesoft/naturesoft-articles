module Naturesoft::Articles
  class Category < ApplicationRecord
		validates :name, presence: true
    
    belongs_to :user
    has_and_belongs_to_many :articles
    belongs_to :parent, class_name: "Category", optional: true
    has_many :children, class_name: "Category", foreign_key: "parent_id"
    after_save :update_level
    
    def update_level
      level = 1
			p = self.parent
			while !p.nil? do
				level += 1
				p = p.parent
			end
			self.update_column(:level, level)
    end
    
    def self.sort_by
      [
			  ["Level","naturesoft_articles_categories.level"],
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
      
      # Parent category
      if params[:parent_id].present?
				records = records.where(parent_id: params[:parent_id])
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
    
    # display name with parent
    def full_name
			names = [self.name]
			p = self.parent
			while !p.nil? do
				names << p.name
				p = p.parent
			end
			names.reverse.join(" >> ")
		end
    
    # data for select2 ajax
    def self.select2(params)
			items = self.search(params).order("level")
			if params[:excluded].present?
				items = items.where.not(id: params[:excluded].split(","))
			end
			options = [{"id" => "nil", "text" => "none"}]
			options += items.map { |c| {"id" => c.id, "text" => c.full_name} }
			result = {"items" => options}
		end
    
  end
end
