class CapitalBook
  attr_reader :id,
              :type,
              :city,
              :title,
              :isbn,
              :publisher,
              :total_books_found
              
  def initialize(data, capital)
    # require 'pry'; binding.pry
    @id = data[:id]
    @type = data[:type]
    @total_books_found = data[:attributes][:numFound]
    @city = capital
    # @books = data[:attributes][:docs]
    @title = data[:attributes][:docs][0][:title]
    @isbn = data[:attributes][:docs][0][:isbn]
    @publisher = data[:attributes][:docs][0][:publisher]
  end
end