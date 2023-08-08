require "rails_helper"

RSpec.describe Recipe do
  describe "existance" do
    it "exists and has attributes", :vcr do
      country = "Thailand"

      recipe_data = RecipeSearchFacade.new.recipes(country)

      expect(recipe_data.count).to eq(20)
      expect(recipe_data.first).to be_a(Recipe)
      expect(recipe_data.first.country).to be_a(String)
      expect(recipe_data.first.country).to eq("Thailand")
      expect(recipe_data.first.id).to eq(nil)
      expect(recipe_data.first.id).to be_an(NilClass)
      expect(recipe_data.first.image).to be_a(String)
      expect(recipe_data.first.title).to be_a(String)
      expect(recipe_data.first.title).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
      expect(recipe_data.first.type).to be_a(String)
      expect(recipe_data.first.type).to eq("recipes")
      expect(recipe_data.first.url).to be_a(String)
      expect(recipe_data.first.url).to eq("https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html")
    end
  end
end
