class RecipeSearchFacade
  def recipes(country)
    recipe_search = EdamamService.new(country).recipes_by_keyword
    recipe_search[:hits].map do |recipe_data|
      recipe_hash = {
        id: nil,
        type: 'recipes',
        attributes: recipe_data }

      Recipe.new(recipe_hash, country)
    end
  end
end
