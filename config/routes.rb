Rails.application.routes.draw do
  resources :groups, only: [:new, :create, :show] do
    #collection do
      #get 'percentage'
    #end
  end
  resources :users, only: %i[new create]
  root 'static_pages#home'
end
