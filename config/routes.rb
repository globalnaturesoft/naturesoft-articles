Naturesoft::Articles::Engine.routes.draw do
  namespace :admin, module: "admin", path: "admin/content" do
    resources :articles do
      collection do
        put "approve"
        put "disapprove"
        put "enable"
        put "disable"
        delete 'delete'
        get 'select2'
      end
    end
    resources :categories do
      collection do
        put "enable"
        put "disable"
        delete 'delete'
        get "select2"
      end
    end
  end
end