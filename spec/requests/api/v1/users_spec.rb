require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "POST /api/v1/users", :vcr do
    it "creates a user" do
      user_params = {
        "name": "Odell",
        "email": "goodboy@ruffruff.com",
        "password": "treats4lyf",
        "password_confirmation": "treats4lyf"
      }

      post "/api/v1/users", params: user_params

      expect(response).to be_successful
      expect(response.status).to eq(201)

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user).to have_key(:data)
      expect(user[:data]).to be_a(Hash)
      expect(user[:data]).to have_key(:id)
      expect(user[:data][:id]).to be_a(String)
      expect(user[:data]).to have_key(:type)
      expect(user[:data][:type]).to eq("user")
      expect(user[:data]).to have_key(:attributes)
      expect(user[:data][:attributes]).to be_a(Hash)
      expect(user[:data][:attributes]).to have_key(:name)
      expect(user[:data][:attributes][:name]).to be_a(String)
      expect(user[:data][:attributes][:name]).to eq("Odell")
      expect(user[:data][:attributes]).to have_key(:email)
      expect(user[:data][:attributes][:email]).to be_a(String)
      expect(user[:data][:attributes][:email]).to eq(user_params[:email])
      expect(user[:data][:attributes]).to have_key(:api_key)
    end

    it 'returns an error if passwords do not match' do
      user_params = {
        "name": "Odell",
        "email": "goodboy@ruffruff.com",
        "password": "treats4lyf",
        "password_confirmation": "bonez4lyf"
      }

      post "/api/v1/users", params: user_params

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user).to have_key(:errors)
      expect(user[:errors]).to eq(["Password confirmation doesn't match Password"])
      expect(user[:errors]).to be_a(Array)
    end
  end
end
