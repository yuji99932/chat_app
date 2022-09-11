Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :groups do 
    resources :messages, only: :create
  end
  resources :users, only: :show do
  end
end
