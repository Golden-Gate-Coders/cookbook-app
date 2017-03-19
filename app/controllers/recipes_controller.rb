class RecipesController < ApplicationController

  # RESTful routes
  def index
    sort = params[:sort]
    sort_order = params[:sort_order]

    if sort && sort_order
      @recipes = Recipe.all.order(sort => sort_order)
    else
      @recipes = Recipe.all
    end
  end

  def show
    recipe_id = params[:id]
    @recipe = Recipe.find_by(id: recipe_id)
  end

  def new
  end

  def create
    input_title = params[:recipe_title]
    input_ingredients = params[:recipe_ingredients]
    input_directions = params[:recipe_directions]

    input_address = params[:recipe_address]

    @recipe = Recipe.new(title: input_title, ingredients: input_ingredients, directions: input_directions)

    coordinates = @recipe.geocode(input_address)
    
    @recipe.latitude = coordinates[0]
    @recipe.longitude = coordinates[1]
    @recipe.save

    flash[:success] = "Recipe created successfully!"
    redirect_to "/recipes/#{@recipe.id}"
  end

  def edit
    recipe_id = params[:id]
    @recipe = Recipe.find_by(id: recipe_id)
  end

  def update
    input_title = params[:recipe_title]
    input_directions = params[:recipe_directions]
    input_chef = params[:recipe_chef]
    input_ingredients = params[:recipe_ingredients]
    input_prep_time = params[:recipe_prep_title]

    @recipe = Recipe.find_by(id: params[:id])
    @recipe.title = input_title
    @recipe.directions = input_directions
    @recipe.chef = input_chef
    @recipe.ingredients = input_ingredients
    @recipe.prep_time = input_prep_time
    @recipe.save

    flash[:info] = "Recipe updated successfully!"
    redirect_to "/recipes/#{@recipe.id}"
  end

  def destroy
    recipe = Recipe.find_by(id: params[:id])
    recipe.destroy

    flash[:danger] = "Recipe destroyed successfully!"
    redirect_to "/recipes"
  end


  def sass_example
  end

end

