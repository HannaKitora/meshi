Rails.application.routes.draw do
  # devise_for :users
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy] # ここを追加
  end
  
  # root to: 'homes#top'
  # resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  #   resource :favorite, only: [:create, :destroy]
  #   resources :post_comments, only: [:create, :destroy]
  # end
  # resources :users, only: [:show, :edit, :update]
  # get "/homes/about" => "homes#about", as: "about"
  
  scope module: :public do
    devise_for :users
    root to: 'homes#top'
    get 'homes/about', to: 'homes#about', as: :about
    resources :post_images, only: [:new, :create, :index, :show, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update]
  end
  
  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'
  # get 'users/show'
  # get 'users/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
