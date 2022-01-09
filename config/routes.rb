Rails.application.routes.draw do
  resources :posts
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  resources :customers
  resources :tasks
  resources :categories # , defaults: { format: 'json' }
  root to: 'projects#index'

  resources :projects
  get 'hello', to: 'projects#hello'

  resources :users
  get 'countries/fetch_cities'

  # resources :countries, defaults: { format: 'json' }
  resources :countries do
    member do
      get 'info'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :main do
        collection do
          get 'about'
        end
      end
    end
  end
  namespace :api do
    namespace :v1 do
      resources :address do
        collection do
          get 'about'
        end
      end
    end
  end

  match 'current_info/:username', to: 'api/v1/main#show', via: :get, constraints: { username: /[a-zA-Z]+/}



end
##