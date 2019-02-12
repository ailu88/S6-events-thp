Rails.application.routes.draw do
  devise_for :users

  resources :events

  resources :attendances

  resources :users

  root 'events#index'

end
