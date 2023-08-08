require "rails_helper"

RSpec.describe 'Recipe Search Endpoints' do
  describe "recipe search: recipes found in database by country keyword" do
    it "returns data about specific recipes based on search query params", :vcr do

      query_params = 
      {
        type: "any",
        q: "Thailand",
        app_id: ENV['app_id'], 
        app_key: ENV['app_key']
      }

      get "/api/v1/recipes", params: query_params

      recipe_data = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(recipe_data).to have_key(:data)
      expect(recipe_data[:data][0]).to have_key(:id)
      expect(recipe_data[:data][0][:id]).to be_a(NilClass)

      expect(recipe_data[:data][0]).to have_key(:type)
      expect(recipe_data[:data][0][:type]).to be_a(String)
      expect(recipe_data[:data][0][:type]).to eq('recipe')

      expect(recipe_data[:data][0]).to have_key(:attributes)
      expect(recipe_data[:data][0][:attributes]).to be_a(Hash)

      expect(recipe_data[:data][0][:attributes]).to have_key(:title)
      expect(recipe_data[:data][0][:attributes][:title]).to be_a(String)

      expect(recipe_data[:data][0][:attributes]).to have_key(:url)
      expect(recipe_data[:data][0][:attributes][:url]).to be_a(String)

      expect(recipe_data[:data][0][:attributes]).to have_key(:country)
      expect(recipe_data[:data][0][:attributes][:country]).to be_a(String)

      expect(recipe_data[:data][0][:attributes]).to have_key(:image)
      expect(recipe_data[:data][0][:attributes][:image]).to be_a(String)
      
      expect(recipe_data[:data][0][:attributes]).to_not have_key(:images) #<---is not present
    end
    
      it "returns data about specific recipes even when no country is selected", :vcr do

      query_params = 
      {
        type: "any",
        q: "",
        app_id: ENV['app_id'], 
        app_key: ENV['app_key']
      }

      get "/api/v1/recipes", params: query_params

      recipe_data = JSON.parse(response.body, symbolize_names: true)
      
      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(recipe_data).to have_key(:data)
      expect(recipe_data[:data][0]).to have_key(:id)
      expect(recipe_data[:data][0][:id]).to be_a(NilClass)

      expect(recipe_data[:data][0]).to have_key(:type)
      expect(recipe_data[:data][0][:type]).to be_a(String)
      expect(recipe_data[:data][0][:type]).to eq('recipe')

      expect(recipe_data[:data][0]).to have_key(:attributes)
      expect(recipe_data[:data][0][:attributes]).to be_a(Hash)

      expect(recipe_data[:data][0][:attributes]).to have_key(:title)
      expect(recipe_data[:data][0][:attributes][:title]).to be_a(String)

      expect(recipe_data[:data][0][:attributes]).to have_key(:url)
      expect(recipe_data[:data][0][:attributes][:url]).to be_a(String)

      expect(recipe_data[:data][0][:attributes]).to have_key(:country)
      expect(recipe_data[:data][0][:attributes][:country]).to be_a(String)

      expect(recipe_data[:data][0][:attributes]).to have_key(:image)
      expect(recipe_data[:data][0][:attributes][:image]).to be_a(String)
    end
  end
end