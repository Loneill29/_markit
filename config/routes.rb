Rails.application.routes.draw do

  resources :topics do
    resources :bookmarks
  end

  get 'about' => 'welcome#about'

  root 'welcome#index'

  devise_for :users
end
