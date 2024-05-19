Rails.application.routes.draw do
  
  root to: 'homes#top'
  devise_for :users
  
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  get "/homes/about" => "homes#about", as: "about"
  resources :users, only: [:show, :edit]
  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'
  # get 'users/show'
  # get 'users/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
