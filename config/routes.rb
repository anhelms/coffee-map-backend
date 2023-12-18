Rails.application.routes.draw do
  #USER
  get "/users" => "users#index"
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"

  #COFFEE SHOPS
  get "/coffee_shops" => "coffee_shops#index"
  post "/coffee_shops" => "coffee_shops#create"
  get "/coffee_shops/:id" => "coffee_shops#show"
  patch "/coffee_shops/:id" => "coffee_shops#update"
end
