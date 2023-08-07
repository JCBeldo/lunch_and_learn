class Api::V1::RecipesController < ApplicationController
  def index
    fetch_recipes = RecipeSearchFacade.new(params).recipes
    render json: RecipeSerializer.new(fetch_recipes)
  end
end
