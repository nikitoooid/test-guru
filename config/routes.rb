Rails.application.routes.draw do
  
  root 'tests#index'
  
  devise_for :users

  # get :signup, to: 'users#new'
  # get :login, to: 'sessions#new'
  # get :logout, to: 'sessions#logout'

  # resources :users, only: :create
  # resources :sessions, only: :create

  resources :tests, only: :index do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests
  end

end
