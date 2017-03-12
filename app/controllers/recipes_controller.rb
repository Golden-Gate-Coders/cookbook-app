class RecipesController < ApplicationController

  # RESTful routes
  def index
    @recipes = Recipe.all
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

    @recipe = Recipe.create(title: input_title, ingredients: input_ingredients, directions: input_directions)
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

    redirect_to "/recipes/#{@recipe.id}"
  end


  def sass_example
  end

end

