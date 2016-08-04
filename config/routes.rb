Naturesoft::Core::Engine.routes.draw do
  scope module: 'articles' do
    namespace :admin do
      resources :articles do
        collection do
          get 'approve'
        end
      end
      resources :article_categories
    end
  end
end