module Naturesoft
  module Articles
    class ArticlesController < Naturesoft::FrontendController
      before_action :get_article, only: {:detail}
      
      def detail
      end
      
      private
      def set_article
        @article = Naturesoft::Articles::Article.find(params[:id])
      end
    end
  end
end