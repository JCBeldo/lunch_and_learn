require 'rails_helper'

RSpec.describe "Favorites index page", type: :request do
  describe "GET /api/v1/favorites", :vcr do
    it "returns all favorites for a user" do
      user = User.create!(name: "Odell", email: "goodboy@ruff.com", password: 'treats4lyf', password_confirmation: 'treats4lyf')

      params = {api_key: user.api_key}

      headers = {"CONTENT_TYPE" => "application/json"}
      get "/api/v1/favorites", headers: headers, params: params

      user_faves = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(user_faves).to be_a(Hash)
      expect(user_faves).to have_key(:data)
      expect(user_faves[:data]).to be_an(Array)
      expect(user_faves[:data].length).to eq(0)
      expect(user_faves).to_not have_key(:errors)
      expect(user_faves).to_not have_key(:status)
    end
  end
end