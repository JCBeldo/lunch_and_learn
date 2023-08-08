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
        expect(books[:docs]).to be_an(Array)
        expect(books[:docs].count).to eq(36)

        expect(books[:docs][0]).to be_a(Hash)
        expect(books[:docs][0]).to have_key(:title)
        expect(books[:docs][0][:title]).to be_a(String)

        expect(books[:docs][0]).to have_key(:publisher)
        expect(books[:docs][0][:publisher]).to be_an(Array)
        expect(books[:docs][0][:publisher][0]).to be_a(String)

        expect(books[:docs][0]).to have_key(:isbn)
        expect(books[:docs][0][:isbn]).to be_an(Array)
        expect(books[:docs][0][:isbn][0]).to be_a(String)
        expect(books[:docs][0][:isbn].count).to eq(2)
      end
    end
  end
end
