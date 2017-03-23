class ImagesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @recipe = Recipe.find_by(id: params[:recipe_id])
  end

  def create
    @recipe = Recipe.find_by(id: params[:recipe_id])
    input_url = params[:image_url]

    Image.create(url: input_url, recipe_id: @recipe.id)
    
    redirect_to "/recipes/#{@recipe.id}"
  end

end
