module Naturesoft
  module Articles
    module Backend
      class OptionsController < Naturesoft::Backend::BackendController
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Articles", naturesoft_articles.backend_articles_path
        end
    
        # GET /update
        def update
          add_breadcrumb "Settings", nil
          
          @options = Naturesoft::Option.options("articles")
        end
      end
    end
  end
end
