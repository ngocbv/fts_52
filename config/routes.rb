Rails.application.routes.draw do
  root "static_pages#home"
  devise_for :users
  resources :users, only: [:show] do
    resources :questions, only: [:new, :create, :index]
    resources :exams, only: [:index, :create]
  end

  namespace :admin do
    root "users#index"
    resources :users, except: :show
    resources :subjects, except: [:show, :new]
  end
end
