require "rails_helper"

RSpec.describe 'Library Search Endpoints' do
  describe "Library search: library found in database by country (capital) keyword" do
    it "returns data about specific books based on search query params", :vcr do

      query_params = 
      {
        location: "France",
        quantity: 5
      }

      get "/api/v1/book_search", params: query_params

      book_data = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(book_data).to have_key(:data)
      expect(book_data[:data]).to have_key(:id)
      expect(book_data[:data][:id]).to be_a(NilClass)

      expect(book_data[:data]).to have_key(:type)
      expect(book_data[:data][:type]).to be_a(String)

      expect(book_data[:data]).to have_key(:attributes)
      expect(book_data[:data][:attributes]).to be_a(Hash)

      expect(book_data[:data][:attributes]).to have_key(:city)
      expect(book_data[:data][:attributes][:city]).to be_a(String)
      expect(book_data[:data][:attributes][:city]).to eq('Paris')

      expect(book_data[:data][:attributes]).to have_key(:total_books_found)
      expect(book_data[:data][:attributes][:total_books_found]).to be_a(Integer)

      expect(book_data[:data][:attributes]).to have_key(:isbn)
      expect(book_data[:data][:attributes][:isbn]).to be_a(Array)

      expect(book_data[:data][:attributes]).to have_key(:publisher)
      expect(book_data[:data][:attributes][:publisher]).to be_a(Array)
    end
  end
end
