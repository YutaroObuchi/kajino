Rails.application.routes.draw do
  resources :groups, only: [:new, :create] do
    #collection do
      #get 'percentage'
    #end
  end
  root 'static_pages#home'
end
