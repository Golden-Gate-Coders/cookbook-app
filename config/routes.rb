Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/recipe" => "recipes#view_recipe"
  get "/sass_example" => "recipes#sass_example"

  get "/new_recipe_form" => "recipes#new_recipe"
  post "/new_recipe" => "recipes#create_recipe"

  # Restful routes

  # Index
  get "/recipes" => "recipes#index"

  # New and Create
  get "/recipes/new" => "recipes#new"
  post "/recipes" => "recipes#create"

  # Show
  get "/recipes/:id" => "recipes#show"




end