Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :events do 
      resources :charges, only: [:new, :create]
      resources :attendances, only: [:show, :index]
    end
    root 'admin#index'
  end
  
  resources :events do 
    resources :charges, only: [:new, :create]
    resources :attendances, only: [:show, :index]
  end

  resources :users

  

 # root 'events#index'

end
