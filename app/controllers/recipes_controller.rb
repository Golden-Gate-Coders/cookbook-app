class RecipesController < ApplicationController

  def view_recipe
    @recipe = Recipe.first
  end

end
