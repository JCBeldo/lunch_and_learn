class BookSearchFacade
  def capital_books(capital)
    book_search = OpenLibraryService.new.get_books(capital)
    book_hash = {
      id: nil,
      type: 'books',
      city: "#{capital}",
      attributes: book_search }
      
    CapitalBook.new(book_hash, capital)
  end
end
