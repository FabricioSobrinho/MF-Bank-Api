Rails.application.routes.draw do
  resources :balances
  resources :account_movements
  mount_devise_token_auth_for 'Client', at: 'auth'

  post 'withdraw' => 'balances#withdraw'
  post 'deposit' => 'balances#deposit'
  post 'transfer' => 'balances#transfer'

  post 'password_validations/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
