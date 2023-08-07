require "rails_helper"

RSpec.describe 'AQI Search Endpoints' do
  describe "AQI search: AQI found in database by country (capital) keyword" do
    it "returns data about specific air_quality based on search query params", :vcr do

      query_params = 
      {
        country: "Thailand"
      }

      get "/api/v1/air_quality", params: query_params

      aqi_data = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(200)
    end
  end
end
