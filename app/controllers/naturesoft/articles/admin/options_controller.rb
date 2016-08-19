module Naturesoft
  module Articles
    module Admin
      class OptionsController < Naturesoft::Admin::AdminController
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Articles", naturesoft_articles.admin_articles_path
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
