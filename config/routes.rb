Rails.application.routes.draw do
  # root 'pages#home'
  devise_for :users
  # root "home#index"
  # root 'pages#home'
  resources :likes
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :show, :create, :destroy]
  end

  root "users#index"
  # root to: "home#index" 



  resources :posts do
    resources :comments, only: [:create, :destroy, :new]
    resources :likes, only: [:create]
  end
end
