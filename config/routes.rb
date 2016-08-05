Naturesoft::Articles::Engine.routes.draw do
  namespace :admin, module: "admin", path: "admin/content" do
    resources :articles do
      collection do
        get "approve"
      end
    end
    resources :categories
  end
end