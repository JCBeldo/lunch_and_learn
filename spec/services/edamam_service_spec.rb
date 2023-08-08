require 'rails_helper'

RSpec.describe EdamamService do
  describe "instance methods" do
    describe "#recipes_by_keyword" do
      it "returns a hash of recipes by country" do
        country = "Estonia"

        recipes = EdamamService.new(country).recipes_by_keyword
        
        expect(recipes[:hits].count).to eq(20)

        expect(recipes[:hits][0]).to have_key(:recipe)
        expect(recipes[:hits][0][:recipe]).to be_a(Hash)
        
        expect(recipes[:hits][0][:recipe][:uri]).to be_a(String)
        expect(recipes[:hits][0][:recipe][:uri]).to eq("http://www.edamam.com/ontologies/edamam.owl#recipe_46eb3c552822d1553cb9f94e2a062f24")
        
        expect(recipes[:hits][0][:recipe][:label]).to be_a(String)
        expect(recipes[:hits][0][:recipe][:label]).to eq("Cinnamon-Cardamom Kringel Bread")
        
        expect(recipes[:hits][0][:recipe][:image]).to be_a(String)
      end
    end
  end
end
