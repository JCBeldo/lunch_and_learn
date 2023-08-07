require "rails_helper"

RSpec.describe Recipe do
  describe "existance" do
    it "exists and has attributes", :vcr do
      params = {
          q: "Thailand" }

      recipe_data = RecipeSearchFacade.new(params).recipes

      expect(recipe_data.count).to eq(20)
      expect(recipe_data.first).to be_a(Recipe)
      expect(recipe_data.first.id).to eq(nil)
      expect(recipe_data.first.id).to be_an(Integer)
      expect(recipe_data.first.bill_number).to be_a(String)
      expect(recipe_data.first.last_action).to be_a(String)
      expect(recipe_data.first.last_action_date).to be_a(String)
      expect(recipe_data.first.state).to be_a(String)
      expect(recipe_data.first.text_url).to be_a(String)
      expect(recipe_data.first.title).to be_a(String)
      expect(recipe_data.first.status).to be_a(NilClass)
      expect(recipe_data.first.description).to be_a(NilClass)
      expect(recipe_data.first.sponsors).to be_a(NilClass)
      expect(recipe_data.first.texts).to be_a(NilClass)
    end

    xit "has more attributes", :vcr do
      params = {
              id: 1722281
              }

      bills_data = BillSearchFacade.new(params).bill
        expect(bills_data.status).to be_a(Integer)
        expect(bills_data.description).to be_a(String)
        expect(bills_data.sponsors).to be_a(Array)
        expect(bills_data.text_url).to be_a(NilClass)
        expect(bills_data.last_action).to be_a(NilClass)
        expect(bills_data.last_action_date).to be_a(NilClass)
        expect(bills_data.texts).to be_an(Array)

      bills_data.texts.map do |doc|
        expect(doc[:doc_id]).to be_a(Integer)
      end

      bills_data.sponsors.map do |sponsor|
        expect(sponsor[:name]).to be_a(String)
        expect(sponsor[:party_id]).to be_a(String)
      end
    end
  end
end