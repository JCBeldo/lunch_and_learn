require 'rails_helper'

RSpec.describe BookSearchFacade do
  describe "class methods" do
    describe "#capital_books" do
      it "returns the book attributes of a city by searching a country" do

        book = BookSearchFacade.new.capital_books('Lisbon')
        
        expect(book).to be_an(Object)
        expect(book).to be_an(CapitalBook)
        expect(book.id).to eq(nil)
        expect(book.type).to eq('books')
        expect(book.city).to eq('Lisbon')
        expect(book.total_books_found).to be_a(Integer)
        expect(book.books).to be_a(Array)
        expect(book.books[0]).to be_an(Hash)
      end
    end
  end
end
