class Recipe < ApplicationRecord

  # @recipe.ingredients_split
  def ingredients_split
    ingredients.split(", ")
  end

  def directions_split
    directions.split(", ")
  end

  def friendly_time
    created_at.strftime("%B %e, %Y")
  end

end
