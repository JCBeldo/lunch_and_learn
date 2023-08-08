class Api::V1::RecipesController < ApplicationController
  def index
    if !params[:q].empty?
      country = params[:q]
    else
      country = RestCountryService.new.get_random_country
    end
      fetch_recipes = RecipeSearchFacade.new.recipes(country)
      render json: RecipeSerializer.new(fetch_recipes) unless fetch_recipes == []
      render json: { "data": [] } if fetch_recipes == []
  end
end
