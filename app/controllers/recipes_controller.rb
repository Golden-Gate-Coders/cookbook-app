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



  def sass_example
  end

end

