Rails.application.routes.draw do
  devise_for :users
  root 'tops#index'
  resources :users, only: [:new] do
    resources :articles, only: [:new] do
      collection do
        get 'user_articles'
      end
    end
  end
  resources :countries, only: [:new] do
    resources :articles, only: [:index]
  end
  resources :articles
end
