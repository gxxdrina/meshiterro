Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'homes/about', as: :about #名前付きルートをaboutにする

  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  #get 'post_images/new'
  #post 'post_images/create'
  #get 'post_images/index'
  #get 'post_images/show'

  resources :users, only: [:show, :edit]
  
end
