class RecipesController < ApplicationController

  def view_recipe
    @recipe = Recipe.first
  end

  def all_recipes
    @recipes = Recipe.all
  end

end
