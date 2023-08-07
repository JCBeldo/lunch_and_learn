require "rails_helper"

RSpec.describe 'AQI Search Endpoints' do
  describe "AQI search: AQI found in database by country capital keyword" do
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