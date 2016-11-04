module Naturesoft
  module Articles
    class ArticlesController < Naturesoft::FrontendController
      before_action :get_article, only: [:detail]
      before_action :get_category, only: [:listing, :faq]
      
      def about_us
      end
      
      def listing
        @articles = Article.search_frontend(params).paginate(:page => params[:page], :per_page => 5)
      end
      
      def detail
      end
      
      def faq
      end
      
      private
        def get_article
          @article = Naturesoft::Articles::Article.find(params[:id])
        end
        
        def get_category
          @category = params[:cat_id].present? ? Naturesoft::Articles::Category.find(params[:cat_id]) : nil
        end
    end
  end
end