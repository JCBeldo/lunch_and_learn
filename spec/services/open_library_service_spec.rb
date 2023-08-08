require 'rails_helper'

RSpec.describe OpenLibraryService do
  describe "instance_methods" do
    describe "#get_books" do
      it 'returns a hash of books by keyword(capital)', :vcr do
        capital = 'libson'

        books = OpenLibraryService.new.get_books(capital)

        expect(books).to have_key(:numFound)
        expect(books[:numFound]).to be_a(Integer)
        
        expect(books).to have_key(:docs)
        expect(books[:docs]).to be_a(Array)
        expect(books[:docs].count).to eq(36)

        expect(books[:docs][0]).to be_an(Array)

      end
    end
  end
end