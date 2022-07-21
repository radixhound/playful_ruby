Rails.application.routes.draw do
  devise_for :login_credentials
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "lobby#index"
end
