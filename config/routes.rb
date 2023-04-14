Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'homes/about', as: :about #名前付きルートをaboutにする

  #親子関係 ネストする
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy] # resource(単数)だとURLにidが入らない
    resources :post_comments, only: [:create, :destroy]
  end
  
  resources :users, only: [:show, :edit, :update]
end
