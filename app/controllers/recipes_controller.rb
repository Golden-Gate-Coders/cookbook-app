class RecipesController < ApplicationController

  def view_recipe
    @recipe = Recipe.first
  end

  def index
    @recipes = Recipe.all
  end

  def sass_example
  end

  def new_recipe
  end

  def create_recipe
    input_title = params[:recipe_title]
    input_ingredients = params[:recipe_ingredients]
    input_directions = params[:recipe_directions]

    @recipe = Recipe.create(title: input_title, ingredients: input_ingredients, directions: input_directions)
  end

end

