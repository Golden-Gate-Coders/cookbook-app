class Recipe < ApplicationRecord

  # Instance Methods
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


  # Class Methods
  # Recipe.recipes_by_john
  def self.recipes_by_john
    recipes = Recipe.all
    john_recipes = []
    recipes.each do |recipe|
      if recipe.chef == "John Smith"
        john_recipes << recipe
      end
    end
    john_recipes
  end


  # Geocoding model method
  def geocode(address)
    coordinates = Geocoder.coordinates(address)
    return coordinates
  end


end
