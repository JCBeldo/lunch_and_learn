require "rails_helper"

RSpec.describe 'Learning Resource Search Endpoints' do
  describe 'learning resource search: resources found in database by country keyword' do
    it 'returns data about specific learning resources based on search query params', :vcr do
      country = 'Taiwan'
      get "/api/v1/learning_resources?country=#{country}"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      learning_resource_data = JSON.parse(response.body, symbolize_names: true)

      expect(learning_resource_data).to be_a(Hash)
      expect(learning_resource_data).to have_key(:data)

      expect(learning_resource_data[:data]).to be_a(Hash)
      expect(learning_resource_data[:data]).to have_key(:id)
      expect(learning_resource_data[:data][:id]).to be_a(NilClass)

      expect(learning_resource_data[:data]).to have_key(:type)
      expect(learning_resource_data[:data][:type]).to be_a(String)
      expect(learning_resource_data[:data][:type]).to eq('learning_resource')

      expect(learning_resource_data[:data]).to have_key(:attributes)
      expect(learning_resource_data[:data][:attributes]).to be_a(Hash)
      expect(learning_resource_data[:data][:attributes][:country]).to be_a(String)
      expect(learning_resource_data[:data][:attributes][:country]).to eq(country)

      expect(learning_resource_data[:data][:attributes]).to have_key(:video)
      expect(learning_resource_data[:data][:attributes][:video]).to have_key(:title)
      expect(learning_resource_data[:data][:attributes][:video][:title]).to be_a(String)
      expect(learning_resource_data[:data][:attributes][:video]).to have_key(:video_id)
      expect(learning_resource_data[:data][:attributes][:video][:video_id]).to be_a(String)

      expect(learning_resource_data[:data][:attributes]).to have_key(:images)
      expect(learning_resource_data[:data][:attributes][:images]).to be_a(Array)
      expect(learning_resource_data[:data][:attributes][:images].count).to eq(10)

      learning_resource_data[:data][:attributes][:images].each do |image|
        expect(image).to have_key(:alt_tag)
        expect(image[:alt_tag]).to be_a(String)
        expect(image).to have_key(:url)
        expect(image[:url]).to be_a(String)
      end
    end

    it 'returns an empty array if no resources are found', :vcr do
      country = '6478wyrufjksd'
      get "/api/v1/learning_resources?country=#{country}"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      learning_resource_data = JSON.parse(response.body, symbolize_names: true)

      expect(learning_resource_data).to be_a(Hash)
      expect(learning_resource_data).to have_key(:data)
      expect(learning_resource_data[:data]).to be_a(Hash)

      expect(learning_resource_data[:data]).to have_key(:id)
      expect(learning_resource_data[:data][:id]).to be_a(NilClass)

      expect(learning_resource_data[:data]).to have_key(:type)
      expect(learning_resource_data[:data][:type]).to be_a(String)
      expect(learning_resource_data[:data][:type]).to eq('learning_resource')

      expect(learning_resource_data[:data]).to have_key(:attributes)
      expect(learning_resource_data[:data][:attributes]).to be_a(Hash)
      expect(learning_resource_data[:data][:attributes][:country]).to be_a(String)
      expect(learning_resource_data[:data][:attributes][:country]).to eq(country)
      expect(learning_resource_data[:data][:attributes]).to have_key(:video)
      expect(learning_resource_data[:data][:attributes][:video]).to eq({})
      expect(learning_resource_data[:data][:attributes]).to have_key(:images)
      expect(learning_resource_data[:data][:attributes][:images]).to eq([])
    end
  end
end
