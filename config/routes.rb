Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "/guitars" => "guitars#index"
  get "/guitars/:id" => "guitars#show"
  post "/guitars" => "guitars#create"
  patch "/guitars/:id" => "guitars#update"
  delete "/guitars/:id" => "guitars#destroy"

  get "/images" => "images#index"
  get "/images/:id" => "images#show"
  post "/images" => "images#create"
  patch "/images/:id" => "images#update"
  delete "/images/:id" => "images#destroy"


  # Defines the root path route ("/")
  # root "posts#index"
end
