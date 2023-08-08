require "rails_helper"

RSpec.describe CapitalBook do
  describe "existance" do
    it "exists and has attributes", :vcr do
      capital = "lisbon"

      book_data = BookSearchFacade.new.capital_books(capital)
# require 'pry'; binding.pry
      expect(book_data).to be_a(CapitalBook)
      expect(book_data.city).to be_a(String)
      expect(book_data.city).to eq("Lisbon")
      expect(book_data.id).to eq(nil)
      expect(book_data.id).to be_an(NilClass)
      expect(book_data.isbn).to be_a(String)
      expect(book_data.title).to be_a(String)
      expect(book_data.title).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
      expect(book_data.type).to be_a(String)
      expect(book_data.type).to eq("books")
      expect(book_data.publisher).to be_a(String)
      expect(book_data.publisher).to eq("https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html")
    end
  end
end
