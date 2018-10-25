Rails.application.routes.draw do

  get 'users/show'

  get 'likes/index'

  resources :topics do
    resources :bookmarks, except: [:index]
  end

  resources :bookmarks do
    resources :likes, only: [:index, :create, :destroy]
  end

  get 'about' => 'welcome#about'

  root 'welcome#index'

  devise_for :users
  resources :users, only: [:show]
end
