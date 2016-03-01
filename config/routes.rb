Rails.application.routes.draw do
  root "static_pages#home"
  devise_for :users
  resources :users, only: [:show] do
    resources :questions
  end

  resources :exams, except: [:new, :destroy, :edit]

  namespace :admin do
    root "users#index"
    resources :users, except: :show
    resources :subjects, except: [:show, :new]
  end
end
