module Naturesoft
  module Articles
    class CategoriesController < Naturesoft::FrontendController
      before_action :get_category, only: [:newest_article]
      
      def newest_article
        @article = @category.get_newest_article
      end
      
      private
      def get_category
        @category = Naturesoft::Articles::Category.find(params[:id])
      end
    end
  end
end