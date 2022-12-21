Rails.application.routes.draw do
  devise_for :login_credentials
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :player do
    resources :movement_intents, only: :create
    resources :action_intents, only: :create
    resources :command_intents, only: :create
  end

  resources :configuration, only: [:edit, :update]

  # Defines the root path route ("/")
  root "lobby#index"
end
