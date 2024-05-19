Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  get "/homes/about" => "homes#about", as: "about"
  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'
  # get 'users/show'
  # get 'users/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
