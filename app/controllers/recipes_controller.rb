class RecipesController < ApplicationController
  before_action :authenticate_user!

  # RESTful routes
  def index
    # sort = params[:sort]
    # sort_order = params[:sort_order]
    # time = params[:time]

    # if time
    #   @recipes = Recipe.where("prep_time < ?", 20)
    #   if sort
    #     @recipes = @recipes.order(prep_time: :desc)
    #   end
    # elsif sort && sort_order
    #   @recipes = Recipe.all.order(sort => sort_order)
    # else
    #   @recipes = Recipe.all
    # end

    @recipes = current_user.recipes
  end

  def show
    recipe = Recipe.find_by(id: params[:id])
    recipe_user_id = recipe.user_id

    if current_user.id == recipe_user_id
      if params[:id] == "random"
        # Select random recipe from the database
        recipes = Recipe.all
        @recipe = recipes.sample
      else
        recipe_id = params[:id]
        @recipe = Recipe.find_by(id: recipe_id)
      end
    else
      flash[:danger] = "You cannot see this recipe!"
      redirect_to "/"
    end
  end

  def search
    search_term = params[:search_term]
    @recipes = Recipe.where("title ILIKE ?", "%#{search_term}%")
    render :index
  end

  def new
  end

  def create
    input_title = params[:recipe_title]
    input_ingredients = params[:recipe_ingredients]
    input_directions = params[:recipe_directions]
    input_chef_id = params[:recipe][:chef_id]
    input_prep_time = params[:recipe_prep_time]

    input_address = params[:recipe_address]

    @recipe = Recipe.new(title: input_title, ingredients: input_ingredients, directions: input_directions, chef_id: input_chef_id, prep_time: input_prep_time, user_id: current_user.id)

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

