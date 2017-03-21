Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "recipes#index"

  get "/sass_example" => "recipes#sass_example"

  # Restful routes

  # Index
  get "/recipes" => "recipes#index"

  # New and Create
  get "/recipes/new" => "recipes#new"
  post "/recipes" => "recipes#create"

  # Show
  get "/recipes/:id" => "recipes#show"

  # Edit and Update
  get "/recipes/:id/edit" => "recipes#edit"
  patch "/recipes/:id" => "recipes#update"

  # Delete
  delete "/recipes/:id" => "recipes#destroy"

  # Search
  post "/search" => "recipes#search"


  # Images Form
  get "/recipes/:recipe_id/images/new" => "images#new"
  post "/recipes/:recipe_id/images" => "images#create"



end





