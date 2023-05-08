Rails.application.routes.draw do
  get 'users/account'
  get 'users/profile'

  get 'rooms/own'
  
  
  get 'users/create'
  get 'users/new'
  get 'users/update'
  get 'users/sign_out',to: 'users/sessions#destroy'  #セッションの削除(ログアウト)

  resources :reservations do
    member do
      post 'confirm' => 'reservations#confirm'
      post 'back'
    end
  end

  root to: 'home#index'

  resources :rooms
  devise_for :users, controllers: { 
    sessions: "users/sessions", 
    registrations: 'users/registrations'
  }
  get 'users/edit', to: "users/registrations#edit"
  get 'users/profile_edit'
  
  
end
