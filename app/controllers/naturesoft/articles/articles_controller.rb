module Naturesoft
  module Articles
    class ArticlesController < Naturesoft::FrontendController
      #before_action :get_article, only: [:detail]
      
      def about_us
      end
      
      def listing
      end
      
      def detail
      end
      
      def faq
      end
      
      private
      def get_article
        @article = Naturesoft::Articles::Article.find(params[:id])
      end
    end
  end
end