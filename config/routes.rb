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
  delete "/coffee_shops/:id" => "coffee_shops#destroy"

  #REVIEWS
  get "/reviews" => "reviews#index"
  post "/reviews" => "reviews#create"
  get "/reviews/:id" => "reviews#show"
  patch "/reviews/:id" => "reviews#update"
  delete "/reviews/:id" => "reviews#destroy"

  #TRIPS
  get "/trips" => "trips#index"
  post "/trips" => "trips#create"
  get "/trips/:id" => "trips#show"
  patch "/trips/:id" => "trips#update"
  delete "/trips/:id" => "trips#destroy"

  #IMAGES
  get "/images" => "images#index"
end
