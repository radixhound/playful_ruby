Rails.application.routes.draw do
  devise_for :login_credentials
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :player do
    resources :movement_intents, only: :create
  end

  # Defines the root path route ("/")
  root "lobby#index"
end
