Rails.application.routes.draw do
  devise_for :users
  root 'tops#index'
<<<<<<< HEAD
  resources :users, only: [:edit, :update]
  resources :countries, only: [:new, :create, :edit, :update] do
    resources :articles, only: [:index]
  end
  resources :articles, only: [:index, :new, :create]
=======
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
>>>>>>> 7efb16f... article commit
end
