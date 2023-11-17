Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post 'api/test', to: 'application#test'

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:show, :create, :update, :destroy]
    resource :session, only: [:show, :create, :destroy]
    resources :homes, only: [:show, :index, :create, :update, :destroy]
    resources :searches, only: [:show, :index, :create, :update, :destroy]
    resources :likes, only: [:index, :create, :destroy]
    get 'homes/search', to: 'homes#search'
  end

  get '*path', to: "static_pages#frontend_index"

end

