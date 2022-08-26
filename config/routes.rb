Rails.application.routes.draw do
  resources :histogram, only: [:index, :create] 

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "histogram#index"
end
