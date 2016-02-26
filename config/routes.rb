Rails.application.routes.draw do
  root "static_pages#home"
  devise_for :users
  resources :users, only: [:show] do
    resources :questions, only: [:new, :create, :index]
  end
  
  namespace :admin do
    root "users#index"
    resources :users
  end
end
