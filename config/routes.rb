Naturesoft::Articles::Engine.routes.draw do
  namespace :admin, module: "admin", path: "admin/articles" do
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