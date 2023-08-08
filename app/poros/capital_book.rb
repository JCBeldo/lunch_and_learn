class CapitalBook
  attr_reader :id,
              :type,
              :city,
              :title,
              :isbn,
              :publisher,
              :total_books_found,
              :books
              
  def initialize(data, capital)
    @id = data[:id]
    @type = data[:type]
    @total_books_found = data[:attributes][:numFound]
    @city = capital
    @books = data[:attributes][:docs]
    @title = @books[0][:title]
    @isbn = @books[0][:isbn]
    @publisher = @books[0][:publisher]
  end
end