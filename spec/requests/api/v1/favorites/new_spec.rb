require 'rails_helper'

RSpec.describe "Favorites", type: :request do
  describe "POST /api/v1/favorites", :vcr do
    it "creates a favorite" do
      user = User.create!(name: "Odell", email: "goodboy@ruff.com", password: 'treats4lyf', password_confirmation: 'treats4lyf') 

      user_params = {
        api_key: user.api_key,
        country: "United States",
        recipe_link: "https://www.edamam.com/recipe/teriyaki-chicken-recipe-1a6a6f8c9e9e8f6b4b7e0f8f0f8f0f8f0f8f0f8f0f8f0f8f0f8f0f8f0f8f0f8f0f8f0f8f0f8f0f8f0f8f0",
        recipe_title: "Teriyaki Chicken"
      }

      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/favorites", headers: headers, params: JSON.generate(user_params)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      favorite = JSON.parse(response.body, symbolize_names: true)

      expect(favorite).to be_a(Hash)
      expect(favorite).to have_key(:success)
      expect(favorite[:success]).to eq("Favorite successfully created")
      expect(favorite).to_not have_key(:errors)
      expect(favorite).to_not have_key(:status)
      expect(favorite.length).to eq(1)
    end
  end
end
