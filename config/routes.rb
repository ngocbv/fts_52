require "sidekiq/web"

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
    resources :exams, only: [:index]
    resources :admin_logs, only: [:index]
    resources :questions
    resources :suggested_questions, only: [:index]
  end

  mount Sidekiq::Web, at: "/sidekiq"
  mount DelayedJobWeb => "/delayed_job"
end
