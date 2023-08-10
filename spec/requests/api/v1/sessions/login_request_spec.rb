require 'rails_helper'

RSpec.describe 'Registered login user', type: :request do
  describe 'POST /api/v1/sessions' do
    it 'login user with valid credentials' do
      user = User.create!(name: "Odell", email: "goodboy@ruff.com", password: 'treats4lyf', password_confirmation: 'treats4lyf')

      user_params = {
        email: "goodboy@ruff.com",
        password: "treats4lyf"
      }
      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/sessions", headers: headers, params: JSON.generate(user_params)
      
      expect(response).to be_successful
      expect(response.status).to eq(200)
      
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key(:data)
      expect(json[:data]).to be_a(Hash)
      expect(json[:data]).to have_key(:id)
      expect(json[:data][:id]).to be_a(String)
      expect(json[:data]).to have_key(:type)
      expect(json[:data][:type]).to be_a(String)
      expect(json[:data]).to have_key(:attributes)
      expect(json[:data][:attributes]).to be_a(Hash)
      expect(json[:data][:attributes]).to have_key(:name)
      expect(json[:data][:attributes][:name]).to be_a(String)
      expect(json[:data][:attributes][:name]).to eq(user.name)
      expect(json[:data][:attributes]).to have_key(:email)
      expect(json[:data][:attributes][:email]).to be_a(String)
      expect(json[:data][:attributes][:email]).to eq(user.email)
      expect(json[:data][:attributes]).to have_key(:api_key)
      expect(json[:data][:attributes][:api_key]).to be_a(String)
      expect(json[:data][:attributes][:api_key]).to eq(user.api_key)
      expect(json[:data][:attributes]).to_not have_key(:password)
      expect(json[:data][:attributes]).to_not have_key(:password_confirmation)
    end

    it 'returns an error if invalid credentials' do
      user = User.create!(name: "Odell", email: "gooboy@ruff.com", password: 'treats4lyf', password_confirmation: 'treats4lyf')

      user_params = {
        email: "badboy@ruff.net",
        password: "treats4lyf"
      }

      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/sessions", headers: headers, params: JSON.generate(user_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json).to have_key(:errors)
      expect(json[:errors]).to eq("Invalid credentials")
      expect(json[:errors]).to be_a(String)
      expect(json).to_not have_key(:data)
      expect(json).to_not have_key(:attributes)
      expect(json).to_not have_key(:id)
      expect(json).to_not have_key(:password)
      expect(json).to_not have_key(:password_confirmation)
    end
  end
end