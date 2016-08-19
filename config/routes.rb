Naturesoft::Articles::Engine.routes.draw do
  # Frontend
  #get "/detail/:id.html" => "articles#detail", as: :detail_articles
  get "/:parent_title/:id/:title.html" => "categories#newest_article", as: :newest_article_categories
  
  namespace :admin, module: "admin", path: "admin/content" do
    resources :articles do
      collection do
        put "approve"
        put "disapprove"
        put "enable"
        put "disable"
        delete 'delete'
      end
    end
    resources :categories do
      collection do
        put "enable"
        put "disable"
        delete 'delete'
      end
    end
    
    # Setting page
    get 'settings' => 'options#index', :as => :options
  end
end