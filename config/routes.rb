Rails.application.routes.draw do
  get    '/login', to: 'user_sessions#new'
  post   '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'

  resources :groups, only: [:new, :create, :show] do
    resources :houseworks, only: %i[new create edit update index]
  end
  resources :users, only: %i[new create]
  resources :calculations, only: %i[new create]
  resources :singleshots, only: %i[new create edit update] do
    member do
      get 'your_burden'
      patch 'your_burden_update'
      get 'partner_burden'
      patch 'partner_burden_update'
    end
  end
  root 'static_pages#home'
end

