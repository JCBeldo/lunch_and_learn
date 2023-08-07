class RecipeSearchFacade
  def initialize(params)
    @params = params
  end

  def recipes
    recipe_search = EdamamService.new(@params).recipes_by_keyword
    recipe_search[:hits].map do |recipe_data|
      recipe_hash = {
        id: nil,
        type: 'recipes',
        attributes: recipe_data }

      Recipe.new(recipe_hash)
    end
  end
end