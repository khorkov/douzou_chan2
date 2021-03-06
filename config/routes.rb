Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  scope "(:locale)" do
    resources :pics
    get 'home/index'
    get 'home/signin'
    get 'home/admin'
    get 'home/near'
    get 'home/search_nearby'

    get "home", to: "home#index", as: "user_root"
    root 'home#index'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :users, only: [ :show, :edit, :update, :index ]
    resources :posts, only: [ :create, :destroy, :new, :edit, :index ]
    get "posts/get_geo"
    get "posts/get_wiki"
    get "posts/get_near_posts"
    get "posts/renew_bounds"
    get "posts/like_post"
    get "posts/like_pic"
    get "posts/:id", to: 'posts#show'
    patch 'posts/:id', controller: 'posts', action: :update
    resources :contributions, only: [ :index, :show, :edit, :new, :update ]
    resources :comments,          only: [:create, :destroy, :index]
  end
end
