Rails.application.routes.draw do
  get 'accounts/show'
  devise_for :users
  root to: "home#index"
  resources :users
  resources :rooms
  get 'users/account', to: 'account#show'
  get 'users/account/edit', to: 'devise/registrations#edit'
end
