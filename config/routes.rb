Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  patch 'images/:id' => 'images#update'
  get 'images/:id/edit' => 'images#edit', as:'edit_image'

  resources :images do
    resources :likes, only: [:create, :destroy]
  end

  resources :lists do
    resources :likes, only: [:create, :destroy]
  end
  

  post "posts/check_cache_image"
  root 'lists#index'

end