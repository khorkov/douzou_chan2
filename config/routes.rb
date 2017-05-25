Rails.application.routes.draw do
  resources :contributions
  resources :pics
  get 'home/index'

  get "home", to: "home#index", as: "user_root"
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [ :show, :edit, :update ]
  resources :posts, only: [ :create, :destroy, :new, :edit ]
  get "posts/get_geo"
  get "posts/:id", to: 'posts#show'
  patch 'posts/:id', controller: 'posts', action: :update
end
