Rails.application.routes.draw do
  get    '/login', to: 'user_sessions#new'
  post   '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'

  resources :groups, only: [:new, :create, :show] do
    #collection do
      #get 'percentage'
    #end
  end
  resources :houseworks, only: %i[new create edit update index]
  resources :users, only: %i[new create]
  root 'static_pages#home'
end
