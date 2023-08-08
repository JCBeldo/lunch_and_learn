class Api::V1::RecipesController < ApplicationController
  def index
    country = params[:q]
    fetch_recipes = RecipeSearchFacade.new.recipes(country)
    render json: RecipeSerializer.new(fetch_recipes)
  end
end
