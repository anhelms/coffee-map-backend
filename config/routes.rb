Rails.application.routes.draw do
  #USER
  get "/users" => "users#index"
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"

  #COFFEE SHOPS
  # get "/coffeeshops" => "coffeeshops#index"

end
