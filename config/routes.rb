Naturesoft::Core::Engine.routes.draw do
  scope module: 'articles' do
    namespace :admin do
      resources :articles
    end
  end
end