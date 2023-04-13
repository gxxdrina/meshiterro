Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  #get 'post_images/new'
  #post 'post_images/create'
  #get 'post_images/index'
  #get 'post_images/show'

  get 'homes/about', as: :about #名前付きルートをaboutにする
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
