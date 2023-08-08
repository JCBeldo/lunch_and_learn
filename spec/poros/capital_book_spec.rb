require "rails_helper"

RSpec.describe CapitalBook do
  describe "existance" do
    it "exists and has attributes", :vcr do
      capital = "Lisbon"

      book_data = BookSearchFacade.new.capital_books(capital)

      expect(book_data).to be_a(CapitalBook)
      expect(book_data.city).to be_a(String)
      expect(book_data.city).to eq("Lisbon")

      expect(book_data.id).to eq(nil)
      expect(book_data.id).to be_a(NilClass)

      expect(book_data.isbn).to be_an(Array)
      expect(book_data.isbn[0]).to be_a(String)
      expect(book_data.isbn.count).to eq(2)

      expect(book_data.title).to be_a(String)
      expect(book_data.title).to eq("Lisbon")

      expect(book_data.type).to be_a(String)
      expect(book_data.type).to eq("books")

      expect(book_data.publisher).to be_an(Array)
      expect(book_data.publisher[0]).to be_a(String)
      expect(book_data.publisher[0]).to eq("J. M. Dent")
    end
  end
end
