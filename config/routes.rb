Rails.application.routes.draw do
  devise_for :users

  resources :events do 
    resources :charges, only: [:new, :create]
  end 

  resources :attendances

  resources :users

  

  root 'events#index'

end
