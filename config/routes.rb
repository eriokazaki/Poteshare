Rails.application.routes.draw do
  get 'users/account'
  get 'users/profile'

  get 'rooms/own'
  
  
  get 'users/create'
  get 'users/new'
  get 'users/edit'
  get 'users/update'
  
  resources :reservations do
    member do
      post 'confirm' => 'reservations#confirm'
      post 'back'
    end
  end

  root to: 'home#index'

  resources :rooms
  devise_for :users
  resources :users

end
