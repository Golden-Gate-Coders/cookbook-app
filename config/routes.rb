Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/recipe" => "recipes#view_recipe"
  get "/all_recipes" => "recipes#all_recipes"

end
