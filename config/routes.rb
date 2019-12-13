Rails.application.routes.draw do
  devise_for :users
  root 'tops#index'
  resources :users, only: [:edit, :update]
  resources :countries, only: [:edit, :update] do
    resources :articles, only: [:index]
  end
  resources :articles, only: [:new, :create]
end
