Rails.application.routes.draw do
  get 'users/account'
  get 'users/profile'
  patch 'users/profile'
  post 'users/profile_edit', to: 'users#profile_update'

  # get 'users/profile/edit', to: 'users#profile_edit'
  # post 'users/profile/edit', to: 'users#profile_edit'
  # patch 'users/profile/edit', to: 'users#profile_update'

  

  get 'rooms/own'
  
  
  get 'users/create'
  get 'users/new'
  get 'users/update'
  


  devise_scope :users do
    get 'users/edit', to: "users/registrations#edit"
  end

  resources :reservations do
    member do
      post 'confirm' => 'reservations#confirm'
      post 'back'
    end
  end

  root to: 'home#index'

  resources :rooms
  devise_for :users, controllers: { 
    sessions: 'users/sessions', 
    registrations: 'users/registrations'
  }
  
  get 'users/edit', to: 'users/registrations#edit'
  get 'users/profile_edit', to: 'users#profile_edit'
  
  
end
